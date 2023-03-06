import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginButtonLayout extends StatelessWidget {
  void Function()? onpressed;
  String? image;
   LoginButtonLayout({required this.onpressed,required this.image,Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextButton(
        onPressed: onpressed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
          image!,
          fit: BoxFit.fill,
          width: 60,
          height: 60,
        )),
      ),
    );
  }
}
