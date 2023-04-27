import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../view/user/user_signup_screen.dart';



class UserSignUpProvider with ChangeNotifier {

  final emailChangedFormKey = GlobalKey<FormState>();
  final pwdChangedFormKey = GlobalKey<FormState>();
  final nameChangedFormKey = GlobalKey<FormState>();
  final petNameChangedFormKey = GlobalKey<FormState>();
  String checkEmail = '';
  String emailValue = '';
  String pwdValue = '';
  String nameValue = '';
  String petNameValue = '';

  bool isTrueCheck = false;



  void emailChangedController(value) {
    emailValue = value;
    notifyListeners();
  }

  void pwdChangedController(value) {
    pwdValue = value;
    notifyListeners();
  }

  void nameChangedController(value) {
    nameValue = value;
    notifyListeners();
  }

  void petNameChangedController(value) {
    petNameValue = value;
    notifyListeners();
  }


  String? nameValidate(value) {
    if (value == null || value.isEmpty) {
      return '필수항목입니다';
    }
    return null;
  }

  String? petNameValidate(value) {
    if (value == null || value.isEmpty) {
      return '필수항목입니다';
    }
    return null;
  }

  String? emailValidate(value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return '이메일 형식이 아닙니다.';
    } else {
      return null;
    }
  }

  String? pwdValidate(value) {
    final validNumbers = RegExp(r'(\d+)');
    final validAlphabet = RegExp(r'[a-zA-Z]');
    final validSpecial = RegExp(r'^[a-zA-Z0-9 ]+$');

    //
    if (value!.length <= 8 || !validNumbers.hasMatch(value) ||
        !validAlphabet.hasMatch(value)) {
      return '문자 또는 숫자를 포함 8글자 이상 이어야 합니다.';
    } else if (validSpecial.hasMatch(value)) {
      return '특수기호를 포함하고 있어야 합니다.';
    } else {
      return null;
    }
  }

  Future<void> checkFunction(BuildContext context) async {

    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (isTrueCheck == false){
      if (nameChangedFormKey.currentState?.validate() != false &&
          petNameChangedFormKey.currentState?.validate() != false &&
          emailChangedFormKey.currentState?.validate() != false &&
          pwdChangedFormKey.currentState?.validate() != false) {
        try {
            CollectionReference<Map<String, dynamic>> collectionReference =
            FirebaseFirestore.instance.collection("user");
            QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await collectionReference.where('userEmail',isEqualTo: emailValue).get();
            for(var element in querySnapshot.docs) {
              if(element.exists) {
                if(context.mounted){
                 return emailExistsShowDialog(context);
                }
              }else{
                if(context.mounted) {
                  return emailCheckShowDialog(context);
                }
              }
            }
          notifyListeners();
        } on FirebaseAuthException catch (e) {
          return print(e);
        }//비지니스 로직에서 쓰면 안되긴 하는데..
      }
    }else if(isTrueCheck == true) {
      await user?.reload();
      if (FirebaseAuth.instance.currentUser?.emailVerified == true) {
        print(user?.uid);
        if(context.mounted) {
          return context.go('/userLoginParentsProfileScreen');
        }
      } else {
        return;
      }
    }
    }


  Future identityVerification(BuildContext context) async{
    try {
      isTrueCheck = true;
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: emailValue, password: pwdValue).then((value) => value,
      );

      await FirebaseAuth.instance.currentUser?.sendEmailVerification();


    } on FirebaseAuthException catch (e) {
      print(e);
    }catch(e){
    print(e);
    }
    if(context.mounted) {
      context.pop();
    }
    return
    notifyListeners();

  }
}
