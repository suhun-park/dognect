import 'package:dognect/user/login/component/data/data.dart';
import 'package:dognect/user/login/kakao/component/kakao_social_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyUserProvider with ChangeNotifier{
  final storage = FlutterSecureStorage();

  Future signOut() async {
    final kakaoModel = KakaoLogin();
    await Firebase.initializeApp();
    try {
      await kakaoModel.logout();
      await FirebaseAuth.instance.signOut();
      String? value = await storage.read(key: FIREBASE_TOKEN_KEY);
      print(value);
      print('sign out complete');

    } catch (e) {
      print('sign out failed');
      print(e.toString());
      return null;
    }
  }
}