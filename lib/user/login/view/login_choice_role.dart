import 'package:dognect/common/color/color.dart';
import 'package:dognect/user/login/component/widget/dropdown_widget.dart';
import 'package:dognect/user/login/view/login_profile_screen.dart';
import 'package:dognect/user/login/view/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginChoiceRole extends StatelessWidget {
  const LoginChoiceRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customWidth = MediaQuery.of(context).size.width;
    final customHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
          child: Center(
            child: Column(
              children:  [
                SizedBox(
                  height: customHeight * 0.01,
                ),
                Text("당신은 누구신가요?",style: TextStyle(fontSize: 40),),
                SizedBox(
                  height: customHeight * 0.3,
                ),
                DropDownWidget(),
               SizedBox(
                 height: customHeight * 0.3,
               ),
               Container(
                 width: customHeight * 0.2,
               child:TextButton(
                  style: TextButton.styleFrom(
                    side: BorderSide(width: 1),
                  ),
                   onPressed: (){Get.to(()=>const SignUpScreen()); }, child: Text("확인",style: TextStyle(fontSize: 30),))
               ),
              ],
            ),
          ),
        ),

    );
  }
}
