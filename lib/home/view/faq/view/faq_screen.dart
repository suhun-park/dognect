import 'package:dognect/common/color/color.dart';
import 'package:dognect/common/layout/default_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../user/login/kakao/component/kakao_social_login.dart';
import '../../../../user/login/kakao/model/kakao_model.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = KakaoModel(KakaoLogin());
    return DefaultLayout(
      title: "설정",
      child: Container(
        child: Center(
          child: IconButton(
            onPressed: ()async{
              await viewModel.login();
              print(viewModel.login());
            },
            icon: Icon(Icons.abc),
          ),
        ),
      ),


    );
  }
}
