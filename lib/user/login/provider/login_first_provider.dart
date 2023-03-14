import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dognect/user/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_user;
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';
import '../component/data/data.dart';
import '../kakao/component/kakao_social_login.dart';
import '../kakao/model/kakao_model.dart';
import '../view/user/user_login_parents_profile_screen.dart';


class LoginFirstProvider with ChangeNotifier {
  final emailFormKey = GlobalKey<FormState>();
  final pwdFormKey = GlobalKey<FormState>();
  String emailLoginValue = '';
  String pwdLoginValue = '';


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
        final credential = await firebase_user.FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailLoginValue, password: pwdLoginValue);
      } on firebase_user.FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  Future<void> kakaoUserCheck(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    final viewModel = KakaoModel(KakaoLogin());
    await viewModel.login();
    await userProvider.userDataGet();
    OAuthToken? token = await TokenManagerProvider.instance.manager.getToken();
    if (token != null && userProvider.userMyModelData.isNotEmpty) {
      try {
        context.go('/homeScreen');
      } catch (e) {
        return null;
      }
    } else if (userProvider.userMyModelData.isEmpty) {
      try {
        UserLoginParentsProfileScreen();
      } catch (e) {
        print("로그인 할 수 없습니다");
      }
    }
  }
}