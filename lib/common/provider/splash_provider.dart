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

import '../../user/provider/user_provider.dart';

class SplashProvider with ChangeNotifier{
  final storage = FlutterSecureStorage();

  void checkToken(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    await userProvider.userDataGet();
    OAuthToken? token = await TokenManagerProvider.instance.manager.getToken();

    if (token?.refreshToken != null) {
      try {
        await storage.write(key: ACCESS_TOKEN_KEY, value: token?.accessToken);
        if(userProvider.userMyModelData.isNotEmpty){
          try {
            context.go('/rootTab');
          }catch(e){
            context.pop(); //로그인 에러
          }
        }else{
          context.go('/loginFirstScreen');
          //context.go('/loginParentsProfileScreen'); 잠깐 수정
        }
      }catch(e) {
        context.go('/loginFirstScreen');
      }
    }else{
      context.go('/loginFirstScreen');
    }
    }
  }