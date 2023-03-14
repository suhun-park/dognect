import 'package:dognect/common/data/color.dart';
import 'package:dognect/common/page/widget/calendar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../home/provider/home_provider.dart';
import '../provider/calendar_provider.dart';
import '../widget/modal_bottom_sheet_widget.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarProvider = Provider.of<CalendarProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        title: Text('달력'),
      ),
      body: Column(
        children: [
          CalendarWidget(),
          Container(
            width: double.infinity,
            height: 40.h,
            color: Colors.cyan,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                    child: Text(homeProvider.formatData)),
                Container(
                  margin: EdgeInsets.only(right: 10.w),
                    child: Text("4개")),
              ],
            ),
          ),

          ModalBottomSheetWidget(),

        ],
      ),
    );
  }
}
