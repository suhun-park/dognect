import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:dognect/common/data/color.dart';
import 'package:dognect/notice/provider/notice_calendar_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoticeCalendarWidget extends StatelessWidget {
  const NoticeCalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noticeCalendarProvider = Provider.of<NoticeCalendarProvider>(context);
    return CalendarTimeline(
      initialDate: DateTime.now(),
      firstDate: DateTime.utc(2000,01,01),
      lastDate: DateTime.utc(2099,01,01),//DateTime.now().add(const Duration(days: 365 * 4)),
      onDateSelected: (date) => noticeCalendarProvider.onDateSelected(date),
      leftMargin: 10,
      monthColor: Colors.black.withOpacity(0.9),
      dayColor: Colors.black.withOpacity(0.6),
      activeDayColor: Colors.white,
      activeBackgroundDayColor: BOTTOMNAVIGATION_COLOR,
      dotsColor: Colors.black.withOpacity(0.6),

      locale: 'ko',

    );
  }
}
