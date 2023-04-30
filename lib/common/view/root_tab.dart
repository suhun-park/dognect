import 'package:dognect/common/data/color.dart';
import 'package:dognect/common/page/chat_gpt/view/chat_gpt_screen.dart';
import 'package:dognect/common/provider/tab_pvrovider.dart';
import 'package:dognect/myuser/view/my_user_screen.dart';
import 'package:dognect/noticeboard/view/notice_board_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../home/view/home_screen.dart';
import '../../notice/view/notice_screen.dart';
import '../layout/default_layout.dart';



class RootTab extends StatelessWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootTabController = Provider.of<TabProvider>(context);
    return Scaffold(
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        shape: CircleBorder(
            side: BorderSide(
              color: BOTTOMNAVIGATION_COLOR,
              width: 3.0.w,
            )
        ),
        childrenButtonSize: Size(80.w, 80.h),
        visible: true,
        backgroundColor: Colors.white,
        buttonSize: Size(56.0.sp,56.0.sp),

        childPadding: EdgeInsets.fromLTRB(0,0,0,20.h),
        elevation: 0,
        iconTheme: const IconThemeData(color: BOTTOMNAVIGATION_COLOR),
        children: [
          SpeedDialChild(
            key: UniqueKey(),
              backgroundColor: WEEK_BOTTOMNAVIGATION_COLOR,
              child: const Icon(Icons.calendar_month,color: Colors.white,),
              shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 3.0.w,
                  ),
              ),
              onTap:() => context.push('/calendarScreen')),
          SpeedDialChild(
              key: UniqueKey(),
              backgroundColor: WEEK_BOTTOMNAVIGATION_COLOR,
              child: Image.asset('assets/img/chatGPT.png',width: 60.w,height:60.h,fit: BoxFit.fitWidth,),
              shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 3.0.w,
                  )
              ),
              onTap:() => context.push('/chatGptScreen')),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5.sp,
        backgroundColor: BOTTOMNAVIGATION_COLOR,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        iconSize: 24.sp,
        selectedFontSize: 15.sp,
        unselectedFontSize: 10.sp,
        type: BottomNavigationBarType.fixed,
        onTap:(index) => rootTabController.tabIndexController(index),
        currentIndex: rootTabController.controllerIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈',),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_outlined), label: '알림장'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment,), label: '게시판'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: '내정보'),
        ],
      ),
      body: IndexedStack(
        index: rootTabController.controllerIndex,
        children:const [
          HomeScreen(),
          NoticeScreen(),
          NoticeBoardScreen(),
          MyUserScreen(),
        ],
      ),
    );
  }
}