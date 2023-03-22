import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/data/color.dart';

class ButtonStyleLayout extends StatelessWidget {
  final void Function()? onPressed;
   const ButtonStyleLayout({required this.onPressed,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed:onPressed,
        backgroundColor: Colors.white,
        child: Icon(Icons.add,color: BOTTOMNAVIGATION_COLOR,),
        shape: CircleBorder(
            side: BorderSide(
              color: BOTTOMNAVIGATION_COLOR,
              width: 3.0.w,
            )
        ),

      ),
    );
  }
}
