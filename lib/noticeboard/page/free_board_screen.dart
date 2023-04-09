import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FreeBoardScreen extends StatelessWidget {
  const FreeBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 20,
        itemBuilder: (context,index){
      return Container(
        margin: EdgeInsets.all(10.w),
        height: 100.h,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black,width: 1.w))
        ),
        child: Column(
          children: [
            Text("오늘 뭐할지 모르겠어요"),
            Row(
              children: [

              ],
            )

          ],
        )
      );
    });
  }
}
