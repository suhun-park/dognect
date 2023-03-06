import 'package:dio/dio.dart';
import 'package:dognect/common/color/color.dart';
import 'package:dognect/home/view/home_screen.dart';
import 'package:dognect/user/login/component/layout/sign_up_text_form.dart';
import 'package:dognect/user/login/component/widget/dropdown_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../component/layout/custom_text_filed_form.dart';
import '../kakao/component/kakao_social_login.dart';
import '../component/widget/kpostal_widget.dart';
import '../kakao/model/kakao_model.dart';

class LoginProfile extends StatelessWidget {
   LoginProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customWidth = MediaQuery.of(context).size.width;
    final customHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Center(
        child:Column(
          children: [

          SizedBox(
            width: customWidth,
            height: customHeight * 0.09,
          ),
            Text('프로필 설정',style: TextStyle(fontSize: 30),),
          SizedBox(
            height: customHeight * 0.2,
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.account_circle,
                    size: customWidth * 0.3,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: customHeight * 0.1,
            ),
            SizedBox(
              width: customWidth * 0.5,
            child:SignUpTextForm(onChanged: (String) => (String){},hintText: '닉네임을 입력해주세요',),
            ),

            SizedBox(
              height: customHeight * 0.20,
            ),
            TextButton(onPressed:(){
              Get.to(() => const HomeScreen());
            }, child: Text('확인',style: TextStyle(fontSize: 20),)),
          ],)
        ),
      );
  }
}

