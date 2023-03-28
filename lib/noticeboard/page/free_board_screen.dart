import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FreeBoardScreen extends StatelessWidget {
  const FreeBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
          shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 20,
            itemBuilder: (context,index){
          return Container(
            height: 100.h,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black,width: 1.w))
            ),
            child: ListTile(

              title: Text("Dd"),
            ),
          );
        }),

    );
  }
}
