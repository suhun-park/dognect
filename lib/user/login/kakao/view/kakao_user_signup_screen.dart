import 'package:dognect/common/data/color.dart';
import 'package:dognect/user/login/component/widget/dropdown_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KakaoUserSignUpScreen extends StatelessWidget {
  const KakaoUserSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                DropDownWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
