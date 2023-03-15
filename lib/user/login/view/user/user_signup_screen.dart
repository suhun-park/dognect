import 'package:dognect/common/layout/custom_text_filed_form.dart';
import 'package:dognect/user/login/component/layout/sign_up_text_form.dart';
import 'package:dognect/user/login/view/user/user_login_parents_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../common/data/color.dart';
import '../../provider/user/user_signup_provider.dart';



class UserSignUpScreen extends StatelessWidget {
  const UserSignUpScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final customWidth = MediaQuery.of(context).size.width;
    final customHeight = MediaQuery.of(context).size.height;
    final getData = Provider.of<UserSignUpProvider>(context);
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/img/splash.png',
                width: 43.w,
                height: 93.h,
              ),
              SizedBox(
                height: 18.64.h,
              ),
              SizedBox(
                height: 46.6.h,
              ),
              SizedBox(
                width: customWidth * 0.95,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '회원님의 이름',
                        style: TextStyle(fontSize: 24),
                      ),
                      Gap(10),
                      SignUpTextForm(
                        globalKey: getData.nameChangedFormKey,
                        onChanged: (value) =>
                            getData.nameChangedController(value),
                        hintText: "이름을 입력해주세요",
                        validator: (value) => getData.nameValidate(value),
                      ),
                      Gap(30),
                      const Text(
                        '애완견 이름',
                        style: TextStyle(fontSize: 24),
                      ),
                      Gap(10),
                      SignUpTextForm(
                        globalKey: getData.petNameChangedFormKey,
                        onChanged: (value) =>
                            getData.petNameChangedController(value),
                        hintText: "애완견의 이름을 입력해주세요",
                        validator: (value) => getData.petNameValidate(value),
                      ),
                      const Gap(30),
                      Text(
                        '이메일',
                        style: TextStyle(fontSize: 24),
                      ),
                      Gap(10),

                      SignUpTextForm(
                              globalKey: getData.emailChangedFormKey,
                              onChanged: (value) =>
                                  getData.emailChangedController(value),
                              hintText: "이메일을 입력해주세요",
                              validator: (value) =>getData.emailValidate(value),
                            ),
                          SizedBox(width: customWidth * 0.03),
                      Gap(10),
                      const Text(
                        '비밀번호',
                        style: TextStyle(fontSize: 24),
                      ),
                      Gap(10),
                      SignUpTextForm(
                        globalKey: getData.pwdChangedFormKey,
                        onChanged: (value) => getData.pwdChangedController(value),
                        hintText: "비밀번호를 입력해주세요",
                        validator: (value) => getData.pwdValidate(value),
                      ),
                      SizedBox(
                        height: customHeight * 0.05,
                      ),
                      SizedBox(
                        height: customHeight * 0.05,
                      ),
                      TextButton(
                          onPressed: () => getData.checkFunction(context),
                          child: getData.isTrueCheck ? const Text(
                            "확인",
                            style: TextStyle(fontSize: 25),
                          ): const Text("인증하기",style: TextStyle(fontSize: 25),)),
                    ]),
              ),
            ],
          ),
        ),
        ),
      );
  }
}
Future emailCheckShowDialog(BuildContext context){
  final getData = Provider.of<UserSignUpProvider>(context,listen: false);
  return showDialog(
      context: context, builder: (BuildContext context) => AlertDialog(
    title: const Text('본인 인증 메시지'),
    content: const Text("확인을 클릭하시면 이메일을 전송합니다"),
    actions: [
      Container(
        child: TextButton(
          child: const Text("확인"),
          onPressed:() => getData.identityVerification(context),
        ),
      ),
      Container(
        child: TextButton(
          child: const Text("취소"),
          onPressed: () => context.pop(),
        ),
      )
    ],
  ));
}
Future emailExistsShowDialog(BuildContext context){
  final getData = Provider.of<UserSignUpProvider>(context,listen: false);
  return showDialog(
      context: context, builder: (BuildContext context) => AlertDialog(
    content: const Text("이미 있는 이메일입니다"),
    actions: [
      Container(
        child: TextButton(
          child: const Text("확인"),
          onPressed:() => context.pop(),
        ),
      ),
    ],
  ));
}

