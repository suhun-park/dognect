import 'package:dognect/common/data/color.dart';
import 'package:dognect/home/provider/home_provider.dart';
import 'package:dognect/notice/common/layout/notice_inkwell_layout.dart';
import 'package:dognect/notice/page/view/album_detail_screen.dart';
import 'package:dognect/notice/page/view/notice_detail_screen.dart';
import 'package:dognect/notice/page/view/teacher_talk_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../user/provider/user_provider.dart';
import '../common/widget/notice_calendar_widget.dart';
import '../provider/notice_provider.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen>with TickerProviderStateMixin{
  late TabController _tabBarController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabBarController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    _tabBarController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BOTTOMNAVIGATION_COLOR,
       title :Text('도그넷',style: TextStyle(fontSize: 20.sp),),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity,35.h),
          child: Container(
            color: Colors.white,
            child: TabBar(
              dividerColor: Colors.black,
              indicatorColor: Colors.black,
              controller: _tabBarController,
              tabs: [
                Container(
                  height: 30.h,
                  alignment: Alignment.center,
                  child: Text("알림장"),
                ),
                Container(
                  height: 30.h,
                  alignment: Alignment.center,
                  child: Text("사진첩"),
                ),
                Container(
                  height: 30.h,
                  alignment: Alignment.center,
                  child: Text("오늘의 한마디"),
                )
              ],
              labelColor: Colors.black,
              /*indicator: const BoxDecoration(
              color: Colors.,
              ),*/

            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabBarController,
        children: [
          NoticeDetailScreen(),
          AlbumDetailScreen(),
          TeacherTalkDetailScreen(),
        ],
      ),
     );
  }
}
