import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dognect/home/view/home_screen.dart';
import 'package:dognect/user/login/component/layout/sign_up_text_form.dart';
import 'package:dognect/user/login/component/widget/dropdown_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

import '../../../common/data/color.dart';
import '../component/layout/custom_text_filed_form.dart';
import '../kakao/component/kakao_social_login.dart';
import '../component/widget/kpostal_widget.dart';
import '../kakao/model/kakao_model.dart';
import '../provider/login_parents_profile_provider.dart';

class LoginParentsProfileScreen extends StatelessWidget {
  LoginParentsProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<LoginParentsProfileProvider>(context);
    final customWidth = MediaQuery.of(context).size.width;
    final customHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/img/splash.png',width: customWidth * 0.1,height: customHeight * 0.1),
              SizedBox(
                height: customHeight * 0.05,
              ),
              Text(
                '프로필 설정',
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(
                height: customHeight * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => getData.imageChange(),
                    child: Container(
                      width: customWidth * 0.3,
                      height: customWidth * 0.3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: getData.imageFile != null
                            ? DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(File(getData.imageFile!.path)),
                        )
                            : null,
                      ),
                      child: getData.imageFile == null
                          ? Icon(
                        Icons.account_circle,
                        size: customWidth * 0.3,
                      )
                          : null,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: customHeight * 0.1,
              ),
              SizedBox(
                width: customWidth * 0.5,
                child: SignUpTextForm(
                  onChanged: (value) => getData.nickNameController(value) ,
                  hintText: '닉네임을 입력해주세요',
                  globalKey: getData.parentsNickNameKey,
                  validator: (value) =>getData.nickNameValidate(value),
                ),
              ),
              SizedBox(
                height: customHeight * 0.20,
              ),
              TextButton(
                onPressed: () => getData.checkFunction(context),
                child: Text(
                  '확인',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}