

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dognect/user/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_user;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../../provider/user_provider.dart';
import '../component/data/data.dart';

class LoginFirstProvider with ChangeNotifier {
  final emailFormKey = GlobalKey<FormState>();
  final pwdFormKey = GlobalKey<FormState>();
  String emailLoginValue = '';
  String pwdLoginValue = '';
  String firebaseUid = '' ;
  final storage = FlutterSecureStorage();


  void emailController(value) {
    emailLoginValue = value;
    notifyListeners();
  }

  void pwdController(value) {
    pwdLoginValue = value;
    notifyListeners();
  }




  String? emailValidator(value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return '이메일 형식이 아닙니다.';
    } else {
      return null;
    }
  }

  String? pwdValidator(value) {
    final validNumbers = RegExp(r'(\d+)');
    final validAlphabet = RegExp(r'[a-zA-Z]');
    final validSpecial = RegExp(r'^[a-zA-Z0-9 ]+$');
    if (value!.length <= 8 ||
        !validNumbers.hasMatch(value) ||
        !validAlphabet.hasMatch(value)) {
      return '문자 또는 숫자를 포함 8글자 이상 이어야 합니다.';
    } else if (validSpecial.hasMatch(value)) {
      return '특수기호를 포함하고 있어야 합니다.';
    } else {
      return null;
    }
  }
  Future<void> loginUserCheckFunction(BuildContext context) async {
    if (emailFormKey.currentState?.validate() != false &&
        pwdFormKey.currentState?.validate() != false) {
      final firebase_user.FirebaseAuth auth =
          firebase_user.FirebaseAuth.instance;
      firebase_user.User? user = auth.currentUser;
      await user?.reload();
      try {
        UserProvider().clearUserData();
        final credential = await firebase_user.FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: emailLoginValue, password: pwdLoginValue);
        final FirebaseAuth auth = FirebaseAuth.instance;
        User? user = auth.currentUser;
        await storage.write(key: COMMON_TOKEN_KEY, value: credential.user?.uid);
        await UserProvider().userDataGet();

        notifyListeners();
        context.go('/rootTab');
      } on firebase_user.FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }








}