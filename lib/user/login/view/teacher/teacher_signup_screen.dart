import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../common/data/color.dart';
import '../../component/layout/sign_up_text_form.dart';
import '../../provider/teacher/teacher_signup_provider.dart';

class TeacherSignupScreen extends StatefulWidget {
  const TeacherSignupScreen({Key? key}) : super(key: key);

  @override
  State<TeacherSignupScreen> createState() => _TeacherSignupScreenState();
}

class _TeacherSignupScreenState extends State<TeacherSignupScreen> {
  @override
  Widget build(BuildContext context) {
    final customWidth = MediaQuery.of(context).size.width;
    final customHeight = MediaQuery.of(context).size.height;
    final teacherSignUpProvider = Provider.of<TeacherSignupProvider>(context);
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                const Text(
                  '회원가입',
                  style: TextStyle(fontSize: 50),
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
                          '선생님의 이름',
                          style: TextStyle(fontSize: 24),
                        ),
                        Gap(10),
                        SignUpTextForm(
                          globalKey: teacherSignUpProvider.nameChangedFormKey,
                          onChanged: (value) =>
                              teacherSignUpProvider.nameChangedController(value),
                          hintText: "이름을 입력해주세요",
                          validator: (value) => teacherSignUpProvider.nameValidate(value),
                        ),
                        Gap(30),
                        const Text(
                          '선생님의 담당',
                          style: TextStyle(fontSize: 24),
                        ),
                        Gap(10),
                        SignUpTextForm(
                          globalKey: teacherSignUpProvider.dogRoleChangedFormKey,
                          onChanged: (value) =>
                              teacherSignUpProvider.petNameChangedController(value),
                          hintText: "선생님의 담당 역할을 입력해주세요",
                          validator: (value) => teacherSignUpProvider.petNameValidate(value),
                        ),
                        const Gap(30),
                        Text(
                          '이메일',
                          style: TextStyle(fontSize: 24),
                        ),
                        Gap(10),

                        SignUpTextForm(
                          globalKey: teacherSignUpProvider.emailChangedFormKey,
                          onChanged: (value) =>
                              teacherSignUpProvider.emailChangedController(value),
                          hintText: "이메일을 입력해주세요",
                          validator: (value) =>teacherSignUpProvider.emailValidate(value),
                        ),
                        SizedBox(width: customWidth * 0.03),
                        Gap(10),
                        const Text(
                          '비밀번호',
                          style: TextStyle(fontSize: 24),
                        ),
                        Gap(10),
                        SignUpTextForm(
                          globalKey: teacherSignUpProvider.pwdChangedFormKey,
                          onChanged: (value) => teacherSignUpProvider.pwdChangedController(value),
                          hintText: "비밀번호를 입력해주세요",
                          validator: (value) => teacherSignUpProvider.pwdValidate(value),
                        ),
                        SizedBox(
                          height: customHeight * 0.05,
                        ),
                        SizedBox(
                          height: customHeight * 0.01,
                        ),
                        TextButton(
                            onPressed: () => teacherSignUpProvider.teacherCheckFunction(context),
                            child: teacherSignUpProvider.isTrueCheck ?  Text(
                              "확인",
                              style: TextStyle(fontSize: 25.sp),
                            ): Text("인증하기",style: TextStyle(fontSize: 25.sp),)),
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
Future teacherEmailCheckShowDialog(BuildContext context){
  final teacherSignupProvider = Provider.of<TeacherSignupProvider>(context,listen: false);
  return showDialog(
      context: context, builder: (BuildContext context) => AlertDialog(
    title: const Text('본인 인증 메시지'),
    content: const Text("확인을 클릭하시면 이메일을 전송합니다"),
    actions: [
      Container(
        child: TextButton(
          child: const Text("확인"),
          onPressed:() => teacherSignupProvider.teacherIdentityVerification(context),
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
Future teacherEmailExistsShowDialog(BuildContext context){
  final teacherSignupProvider = Provider.of<TeacherSignupProvider>(context,listen: false);
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

