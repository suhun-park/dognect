import 'package:dio/dio.dart';
import 'package:dognect/home/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../component/custom_text_filed_form.dart';
import '../component/social_login.dart';
import '../model/kakao_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: LoginHome() ,
    );
  }
}
class LoginHome extends StatelessWidget {
   LoginHome({Key? key}) : super(key: key);

  String username= "";

  String password="";

  final viewModel = KakaoModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset("assets/img/splash.png"),
          CustomTextFieldForm(
            onChanged: (String value) {
              username = value;
            },),
          CustomTextFieldForm(
              onChanged: (String value){
                password = value;
              }),
          IconButton(
            onPressed: ()async{
              await viewModel.login();
              Get.to(() =>HomeScreen());
            },
            icon: Icon(Icons.abc),
          ),
        ],
      ),
    );
  }
}

