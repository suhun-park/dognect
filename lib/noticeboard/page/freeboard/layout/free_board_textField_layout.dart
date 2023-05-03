import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FreeBoardTextFieldLayout extends StatelessWidget {
  final Key? formKey;
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final void Function(String)? onChanged;
    const FreeBoardTextFieldLayout({required this.onChanged,required this.maxLines,required this.formKey,required this.controller,required this.hintText,Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        onChanged: onChanged,
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
        ),

      ),

    );
  }
}
