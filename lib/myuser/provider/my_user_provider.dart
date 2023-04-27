import 'package:dognect/user/login/component/data/data.dart';
import 'package:dognect/user/login/kakao/component/kakao_social_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class MyUserProvider with ChangeNotifier{
  final storage = FlutterSecureStorage();

  void signOut(BuildContext context) async {
    await Firebase.initializeApp();
    try {
     await storage.delete(key: COMMON_TOKEN_KEY);
     context.go('/loginFirstScreen');
      print('sign out complete');

    } catch (e) {
      print('sign out failed');
      print(e.toString());
      return null;
    }
  }
}