import 'package:dognect/common/data/color.dart';
import 'package:dognect/noticeboard/page/album_bulletin_board.dart';
import 'package:dognect/noticeboard/page/free_board_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoticeBoardScreen extends StatefulWidget {
  const NoticeBoardScreen({Key? key}) : super(key: key);

  @override
  State<NoticeBoardScreen> createState() => _NoticeBoardScreenState();
}

class _NoticeBoardScreenState extends State<NoticeBoardScreen> with TickerProviderStateMixin {
  late TabController _tabBarController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabBarController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    _tabBarController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('게시판'),
          centerTitle: true,
          backgroundColor: BOTTOMNAVIGATION_COLOR,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity,35.h),
            child: Container(
              color: Colors.white,
              child: TabBar(
                dividerColor: Colors.black,
                indicatorColor: Colors.black,
                controller: _tabBarController,
                tabs: [
                  SizedBox(
                    height: 30.h,
                    child: Text('자유게시판'),
                  ),
                  Container(
                    height: 30.h,
                    child: Text("앨범게시판"),
                  ),
                ],
                labelColor: Colors.black,
              ),
            ),
          ),
        ),
        body: TabBarView(
      controller: _tabBarController,
      children: [
        FreeBoardScreen(),
        AlbumBulletinBoardScreen(),

      ],
    ),
    );
  }
}

