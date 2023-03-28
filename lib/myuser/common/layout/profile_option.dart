import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileOption extends StatelessWidget {
  final VoidCallback? onClick;
  final String text;
  ProfileOption({
    Key? key,
    this.onClick,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 0.w, vertical: 13.h),
      child: ListTile(
        // contentPadding: EdgeInsets.all(10),
        title: Text(
          text,
          style:  TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        onTap: onClick,
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.black,
        ),
        contentPadding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
        tileColor: Colors.white,
      ),
    );
  }
}
