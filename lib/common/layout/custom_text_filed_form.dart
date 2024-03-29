import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/color.dart';

class CustomTextFieldForm extends StatelessWidget {

  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final Key? globalKey;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextEditingController? controller;

  const CustomTextFieldForm({
    this.controller,
    this.validator,
    this.globalKey,
    this.keyboardType,
    required this.onChanged,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
    this.maxLines,
    Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 300.w,
      child: Form(
        key: globalKey,
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
            keyboardType: keyboardType,
          obscureText: obscureText,
          autofocus: autofocus,
          cursorColor: MY_COLOR,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            hintText: hintText,
            errorText: errorText,
            hintStyle:  TextStyle(color: BODY_TEXT_COLOR,fontSize: 20.sp,fontWeight: FontWeight.bold,fontFamily: 'MaruBuri-Bold.ttf' ),
            fillColor: INPUT_BG_COLOR,
            //false - 배경색 없음
            //true - 배경색 있음
            filled: false,
            // 모든 Input 상태의 기본 스타일 세팅
            ),
            style:  TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,fontFamily: 'Maruburi'),
          ),
      ),
    );
  }
}
