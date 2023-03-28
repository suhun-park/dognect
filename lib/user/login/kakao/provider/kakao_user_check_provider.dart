import 'package:dognect/user/login/provider/login_first_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_provider.dart';
import '../component/kakao_social_login.dart';
import '../model/kakao_model.dart';


class KakaoUserCheckProvider with ChangeNotifier{



  Future<void> kakaoUserCheck(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context,listen: false);
    final viewModel = KakaoModel(KakaoLogin());
    await viewModel.login();
    await userProvider.userDataGet();
    OAuthToken? token = await TokenManagerProvider.instance.manager.getToken();
    if (token != null && userProvider.userMyModelData.isNotEmpty) {
      try {
        context.go('/rootTab');
      } catch (e) {
        return null;
      }
    } else if (userProvider.userMyModelData.isEmpty) {
      try {
        context.push('/kakaoUserSignUpScreen');
      } catch (e) {
        print("로그인 할 수 없습니다");
      }
    }else {
    }
  }

}