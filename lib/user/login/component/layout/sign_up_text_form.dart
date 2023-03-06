import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/color/color.dart';

class SignUpTextForm extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  const SignUpTextForm({
    this.keyboardType,
    required this.onChanged,
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
    this.onSaved,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autofocus: autofocus,
      cursorColor: MY_COLOR,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: BOTTOMNAVIGATION_COLOR,
              )),
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(color: BODY_TEXT_COLOR,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'fonts' ),
        fillColor: TEXT_FORM_COLOR,
        //false - 배경색 없음
        //true - 배경색 있음
        filled: true,
        // 모든 Input 상태의 기본 스타일 세팅
      ),
      style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Maruburi'),

    );
  }
}
