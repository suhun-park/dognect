import 'package:dognect/common/data/color.dart';
import 'package:dognect/home/provider/home_provider.dart';
import 'package:dognect/notice/widget/notice_calendar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../user/provider/user_provider.dart';
import '../provider/notice_provider.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final noticeProvider = Provider.of<NoticeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BOTTOMNAVIGATION_COLOR,
       title :Text(userProvider.userMyModelData[0].kinderGarden!,style: TextStyle(fontSize: 18.sp),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
               Visibility(
                 visible: noticeProvider.isShow,
                child: NoticeCalendarWidget(),),
               TextButton(onPressed: () => noticeProvider.hideCallBack()
               , child:noticeProvider.isShow ?  Text("닫기") : Text("시간 설정하기",style: TextStyle(color: Colors.cyan),)),

              Container(
                margin: EdgeInsets.all(10.w), // 430 대충 20 남음 410
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 300.h,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                          ),
                          child:  Image.asset('assets/img/background_splash.png',width: 50.w,height: 50.h,),
                        ),
                        Text('게시판'),
                        Text('dd',)










                      ],
                    )
                  ],
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
