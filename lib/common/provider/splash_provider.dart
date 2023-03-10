import 'dart:convert';
import 'dart:io';

import 'package:dognect/user/login/provider/login_first_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

import '../../user/login/component/data/data.dart';
import 'package:http/http.dart' as http;

class SplashProvider with ChangeNotifier{
  final storage = FlutterSecureStorage();
  void checkToken(BuildContext context) async {
    final loginFirstProvider = Provider.of<LoginFirstProvider>(context);
    loginFirstProvider.userDataGet();
    OAuthToken? token = await TokenManagerProvider.instance.manager.getToken();

    if (token?.refreshToken != null) {
      try {
        await storage.write(key: ACCESS_TOKEN_KEY, value: token?.accessToken);
        if(loginFirstProvider.userMyModelData.isNotEmpty){
          print(loginFirstProvider.userMyModelData);
          try {
            context.go('/homeScreen');
          }catch(e){
            context.pop(); //로그인 에러
          }
        }else{
          context.go('/loginParentsProfileScreen');
        }
      }catch(e) {
        context.go('/loginFirstScreen');
      }
    }else{
      context.go('/loginFirstScreen');
    }
    }
  }