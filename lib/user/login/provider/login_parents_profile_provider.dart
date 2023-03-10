import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dognect/user/login/provider/role_provider.dart';
import 'package:dognect/user/login/provider/sign_up_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../component/data/data.dart';

class LoginParentsProfileProvider with ChangeNotifier {
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

  Future<void> checkFunction(BuildContext context) async {
    final storage = FlutterSecureStorage();
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    final roleGetData = Provider.of<RoleProvider>(context, listen: false);
    final signUpGetData = Provider.of<SignUpProvider>(context, listen: false);
    try {
      await storage.write(key: FIREBASE_TOKEN_KEY, value: user?.uid);
      await FirebaseFirestore.instance.collection('user').doc().set({
        'petName': signUpGetData.petNameValue,
        'role': roleGetData.dropDownValue,
        'userEmail': signUpGetData.emailValue,
        'userImage': imageFile?.path,
        'userPwd': signUpGetData.pwdValue,
        'nickName': nickNameValue,
        'uid': user?.uid,
      });
      context.go('/homeScreen');
    } catch (e) {
      print(e);
    }
  }

  void imageChange() {
    selectedImages();
  }
}