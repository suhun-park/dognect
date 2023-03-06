import 'package:dognect/common/color/color.dart';
import 'package:dognect/user/login/component/layout/custom_text_filed_form.dart';
import 'package:dognect/user/login/component/layout/sign_up_text_form.dart';
import 'package:dognect/user/login/view/login_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customWidth = MediaQuery.of(context).size.width;
    final customHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Center(
        child: SizedBox(
          width: customWidth,
          height: customHeight * 0.85,
          child: SingleChildScrollView(
          child:Column(
            children: [
              const Text(
                "회원가입",
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(
                height: customHeight * 0.08,
              ),
              SizedBox(
                width: customWidth * 0.65,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '이름',
                        style: TextStyle(fontSize: 24),
                      ),
                      Gap(10),
                      SignUpTextForm(
                        onChanged: (string) {},
                        onSaved: (nameSaved) => () {},
                        hintText: "이름을 입력해주세요",
                      ),
                      Gap(30),
                      const Text(
                        '애완견 이름',
                        style: TextStyle(fontSize: 24),
                      ),
                      Gap(10),
                      SignUpTextForm(
                        onChanged: (string) {},
                        onSaved: (nameSaved) => () {},
                        hintText: "애완견의 이름을 입력해주세요",
                      ),

                      const Gap(30),
                      const Text(
                        '이메일',
                        style: TextStyle(fontSize: 24),
                      ),
                      Gap(10),
                      SignUpTextForm(
                        onChanged: (string) {},
                        onSaved: (emailSaved) => () {},
                        hintText: "이메일을 입력해주세요",
                      ),

                      const Gap(30),
                      const Text(
                        '비밀번호',
                        style: TextStyle(fontSize: 24),
                      ),
                      Gap(10),
                      SignUpTextForm(
                        onChanged: (string) {},
                        onSaved: (pwdSaved) => () {},
                        hintText: "비밀번호를 입력해주세요",
                      ),
                      SizedBox(
                        height: customHeight * 0.05,
                      ),
                      SizedBox(
                        height: customHeight * 0.01,
                      ),
                      Container(
                        child: TextButton(
                            onPressed: () {
                              Get.to(() => LoginProfile());
                            },
                            child: const Text(
                              "확인",
                              style: TextStyle(fontSize: 25),
                            )),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
