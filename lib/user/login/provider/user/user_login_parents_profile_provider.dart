import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dognect/user/login/provider/role_provider.dart';
import 'package:dognect/user/login/provider/user/user_signup_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../component/data/data.dart';

class UserLoginParentsProfileProvider with ChangeNotifier {
  bool hideIcon = true;
  final ImagePicker picker = ImagePicker();
  final parentsNickNameKey = GlobalKey<FormState>();
  XFile? imageFile;
  String nickNameValue = '';

  Future<void> selectedImages() async {
    XFile? selectedImages = await picker.pickImage(
      source: ImageSource.gallery,
    );
    imageFile = selectedImages;
    hideIcon = imageFile != null;
    notifyListeners();
  }

  void nickNameController(value) {
    nickNameValue = value;
    notifyListeners();
  }

  String? nickNameValidate(value) {
    if (value == null || value.isEmpty) {
      return '필수항목입니다';
    }
    return null;
  }


  void imageChange() {
    selectedImages();
  }
  Future<void> checkFunction(BuildContext context) async {
    final storage = FlutterSecureStorage();
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    final roleGetData = Provider.of<RoleProvider>(context, listen: false);
    final signUpGetData = Provider.of<UserSignUpProvider>(context, listen: false);
    try {
      await FirebaseFirestore.instance.collection('user').doc().set({
        'petName': signUpGetData.petNameValue,
        'role': roleGetData.dropDownValue,
        'userEmail': signUpGetData.emailValue,
        'userPwd': signUpGetData.pwdValue,
        'nickName': nickNameValue,
        'uid': user?.uid,
      });
    } catch (e) {
      print(e);
    }
    try {
        String fileName = '${user?.uid!}.png';
        Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('users/$fileName');
        File changeImageFile = File(imageFile!.path);
        UploadTask uploadTask = firebaseStorageRef.putFile(changeImageFile);
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        print(downloadUrl);
    } catch(e){
      print(e);
    }
    notifyListeners();
    return context.go('/loginFirstScreen');
  }
}