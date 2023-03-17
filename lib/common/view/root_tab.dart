import 'package:dognect/common/data/color.dart';
import 'package:dognect/common/provider/tab_pvrovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../home/view/home_screen.dart';
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
              width: 3.0,
            )
        ),
        buttonSize: Size(60.0.sp,60.0.sp),
        visible: true,
        backgroundColor: Colors.white,
        childrenButtonSize: Size(80.0.sp,80.0.sp),
        childPadding: EdgeInsets.only(bottom: 20.h),
        elevation: 0,
        iconTheme: IconThemeData(color: BOTTOMNAVIGATION_COLOR),
        children: [
          SpeedDialChild(
            key: UniqueKey(),
              backgroundColor: WEEK_BOTTOMNAVIGATION_COLOR,
              child: Icon(Icons.calendar_month,color: Colors.white,),
              shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 3.0,
                  ),
              ),
              onTap:() => context.push('/calendarScreen')),
          SpeedDialChild(
              key: UniqueKey(),
              backgroundColor: WEEK_BOTTOMNAVIGATION_COLOR,
              child: Icon(Icons.camera_alt,color: Colors.white,),
              shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 3.0,
                  )
              ),
              onTap:() {}),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        backgroundColor: BOTTOMNAVIGATION_COLOR,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedFontSize: 15,
        unselectedFontSize: 10,
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
          Center(child: Text("알림장"),),
          Center(child: Text("게시판"),),
          Center(child: Text("내정보"),),
        ],
      ),
    );
  }
}