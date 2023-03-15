

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
    final customWidth = MediaQuery.of(context).size.width;
    final customHeight = MediaQuery.of(context).size.height;
    return Scaffold(
          backgroundColor: BACKGROUND_COLOR,
          body: SafeArea(
            child: SizedBox(
              width: customWidth,
              height: customHeight,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: customHeight * 0.05,
                    ),
                    SizedBox(
                        width: customWidth * 0.7,
                        height: customWidth * 0.7,
                        child: Image.asset('assets/img/splash.png')),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: const Text(
                        "애완견과 함께 유치원을 다녀볼까요?",
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    SizedBox(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    '아이디 찾기',
                                    style: TextStyle(
                                        fontSize: 16, color: BODY_TEXT_COLOR),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    '비밀번호 찾기',
                                    style: TextStyle(
                                        fontSize: 16, color: BODY_TEXT_COLOR),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    context.go('/loginChoiceRoleScreen') ;
                                  },

                                  child: const Text(
                                    '회원가입하기',
                                    style: TextStyle(
                                        fontSize: 16, color: BODY_TEXT_COLOR),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                        width: 300.w,
                        height: 50.h,
                        child: TextButton(
                          onPressed: ()  => getData.loginUserCheckFunction(context),
                          style: TextButton.styleFrom(elevation: 1,side: const BorderSide(color: MY_COLOR, width: 2.0),backgroundColor: Colors.white),
                          child: const Text(
                            "로그인",
                            style: TextStyle(
                                fontSize: 20,
                                color: MY_COLOR,
                                fontWeight: FontWeight.bold
                            ),
                          ),)),
                    const SizedBox(height: 25,),
                    const Text('SNS로그인',style: TextStyle(fontSize: 24,fontFamily: 'NanumGothic',fontWeight: FontWeight.w300),),
                    const SizedBox(height: 15,),
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
          ),
    );
  }
}
