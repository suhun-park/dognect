

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../common/data/color.dart';
import '../../../common/layout/custom_text_filed_form.dart';
import '../component/layout/login_button_layout.dart';
import '../provider/login_first_provider.dart';

  class LoginFirstScreen extends StatelessWidget {
    const LoginFirstScreen({Key? key}) : super(key: key);

    @override

    Widget build(BuildContext context) {
      final getData = Provider.of<LoginFirstProvider>(context);
      return Scaffold(
            backgroundColor: BACKGROUND_COLOR,
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                        width: 250.w,
                        height: 250.h,
                        child: Image.asset('assets/img/splash.png')),
                    Container(
                      margin:  EdgeInsets.fromLTRB(0, 20.h, 0, 0),
                      child:  Text(
                        "애완견과 함께 유치원을 다녀볼까요?",
                        style: TextStyle(
                          fontSize: 28.sp,
                        ),
                      ),
                    ),
                     SizedBox(
                      height: 10.h,
                    ),

                    Container(
                      color: Colors.black,
                      height: 250.h,
                      width: 300.w,
                      child: Column(
                        children: [
                          CustomTextFieldForm(
                            globalKey: getData.emailFormKey,
                            onChanged: (value) => getData.emailController(value),
                            hintText: '이메일 입력',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>getData.emailValidator(value),
                          ),
                          CustomTextFieldForm(
                            globalKey: getData.pwdFormKey,
                            onChanged: (value) => getData.pwdController(value),
                            hintText: '비밀번호 입력',
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) => getData.pwdValidator(value),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child:  Text(
                                    '아이디 찾기',
                                    style: TextStyle(
                                        fontSize: 16.sp, color: BODY_TEXT_COLOR),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child:  Text(
                                    '비밀번호 찾기',
                                    style: TextStyle(
                                        fontSize: 16.sp, color: BODY_TEXT_COLOR),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    context.go('/loginChoiceRoleScreen') ;
                                  },

                                  child:  Text(
                                    '회원가입하기',
                                    style: TextStyle(
                                        fontSize: 16.sp, color: BODY_TEXT_COLOR),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                        height: 50.h,
                        width: 300.w,
                        child: TextButton(
                          onPressed: ()  => getData.loginUserCheckFunction(context),
                          style: TextButton.styleFrom(elevation: 1,side:  BorderSide(color: MY_COLOR, width: 2.0.w),backgroundColor: Colors.white),
                          child:  Text(
                            "로그인",
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: MY_COLOR,
                                fontWeight: FontWeight.bold
                            ),
                          ),)),
                     SizedBox(height: 20.h,),
                     Text('SNS로그인',style: TextStyle(fontSize: 24.sp,fontFamily: 'NanumGothic',fontWeight: FontWeight.w300),),
                     SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginButtonLayout(
                          onpressed: () => getData.kakaoUserCheck(context),
                          image: 'assets/img/login/kakao.png',
                        ),
                        LoginButtonLayout(
                            onpressed: () {}, image: 'assets/img/login/naver.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      );
    }
  }
