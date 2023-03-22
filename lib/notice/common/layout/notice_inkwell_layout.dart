import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoticeInkwellLayout extends StatelessWidget {
  final Text title;
  final Text trailing;
  final Text subTitle;
  final Text subContent;
  final void Function()? onTap;
   const NoticeInkwellLayout({required this.onTap,required this.title,required this.trailing,required this.subTitle,required this.subContent,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10.h), // 430 대충 20 남음 410
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: double.infinity,
        height: 250.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading:Container(
                width: 50.w,
                height: 80.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                ),
                child:  Image.asset('assets/img/background_splash.png',),
              ),
              title: title,
              trailing: trailing,
            ),
            Container(
              height: 40.h,
              margin: EdgeInsets.all(10),
              child: subTitle,
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.all(10),
                  child: subContent),
            )
          ],
        ),
      ),
    );
  }
}
