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
         print(await storage.read(key: FIREBASE_TOKEN_KEY));
        if(userProvider.userMyModelData.isNotEmpty){
          try {
            context.go('/rootTab'); // 수정
          }catch(e){
            context.pop(); //로그인 에러
            print('ds');
          }
        }else{
          context.go('/loginFirstScreen');
          print('dd');
          //context.go('/loginParentsProfileScreen'); 잠깐 수정
        }
      }catch(e) {
        context.go('/loginFirstScreen');
        print('df');
      }
    }else if(token?.refreshToken ==null){
     try{
       if(await storage.read(key: FIREBASE_TOKEN_KEY) != null) {
         context.go('/rootTab');
    }else{
         context.go('/loginFirstScreen');
       }
     }catch(e){
       context.go('/loginFirstScreen');
     }
    }else if(await storage.read(key: FIREBASE_TOKEN_KEY) == null && await storage.read(key: REFRESH_TOKEN_KEY) == null){
      context.go('/loginFirstScreen');
    }
    }
  }