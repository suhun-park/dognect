import 'package:dognect/common/data/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FreeBoardScreen extends StatelessWidget {
  const FreeBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push("/freeBoardWrite"),
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add,color: Colors.white,size: 35.sp,),

      ),
      backgroundColor: BACKGROUND_COLOR,
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 20,
              itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              height: 200.h,
              child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20.h),
                  alignment: Alignment.topLeft,
                  height: 150.h,
                  child: Text("안녕하세요 현재 테스트 중입니다"),

                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.1,color: Colors.black)
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline_outlined)),
                        Text("좋아요",style: TextStyle(fontSize: 18.sp),),
                        SizedBox(width: 30.w,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.chat_bubble_outline_rounded)),
                        Text("댓글",style: TextStyle(fontSize: 18.sp),),
                      ],
                    ),
                  ),
                ),
              ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
