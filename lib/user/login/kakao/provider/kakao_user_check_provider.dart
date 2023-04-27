import 'package:dognect/user/login/component/data/data.dart';
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
    if (COMMON_TOKEN_KEY == '' && userProvider.userMyModelData.isEmpty) {
      try {
        context.go('/kakaoUserSignUpScreen');
      } catch (e) {
        return null;
      }
    } else {
      try {
        context.push('/rootTab');
      } catch (e) {
        print("로그인 할 수 없습니다");
      }
    }
  }

}