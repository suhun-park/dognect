import 'package:dognect/common/color/color.dart';
import 'package:dognect/user/login/component/layout/custom_text_filed_form.dart';
import 'package:dognect/user/login/component/layout/login_button_layout.dart';
import 'package:dognect/user/login/controller/login_first_controller.dart';
import 'package:dognect/user/login/view/login_choice_role.dart';
import 'package:dognect/user/login/view/login_profile_screen.dart';
import 'package:dognect/user/login/view/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginFirstScreen extends StatelessWidget {
  const LoginFirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customWidth = MediaQuery.of(context).size.width;
    final customHeight = MediaQuery.of(context).size.height;
   Get.put(LoginFirstController());
    return GetBuilder<LoginFirstController>(

        builder: (controller) =>Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SizedBox(
        width: customWidth,
        height: customHeight,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset('assets/img/splash.png')),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Text(
                  "애완견과 함께 유치원을 다녀볼까요?",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              SizedBox(
                width: 300,
                child: Column(
                  children: [
                CustomTextFieldForm(
                  onChanged: (idResult) => controller.emailController(idResult),
                  hintText: '이메일 입력',
                  keyboardType: TextInputType.emailAddress,
                  onSaved:(emailSaved) => controller.emailSavedController(emailSaved),
                ),
                CustomTextFieldForm(
                  onChanged: (pwdResult) => controller.pwdController(pwdResult) ,
                  hintText: '비밀번호 입력',
                  keyboardType: TextInputType.visiblePassword,
                  onSaved: (pwdSaved) => controller.pwdSavedController(pwdSaved),
                ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '아이디 찾기',
                                      style: TextStyle(
                                          fontSize: 20, color: BODY_TEXT_COLOR),
                                    )),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '비밀번호 찾기',
                                      style: TextStyle(
                                          fontSize: 20, color: BODY_TEXT_COLOR),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Get.to(() =>const LoginChoiceRole());
                                    },
                                    child: const Text(
                                      '회원가입하기',
                                      style: TextStyle(
                                          fontSize: 20, color: BODY_TEXT_COLOR),
                                    )),
                              ],
                            )
                ],
                ),
              ),SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 300,
                  height: 50,
                  child: TextButton(
                      onPressed: () {},
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
                    onpressed: () {},
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
    ));
  }
}
