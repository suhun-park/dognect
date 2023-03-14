import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarProvider with ChangeNotifier {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  void calendarDayMangeMent(DateTime selectDay, DateTime focusDay) {
    selectedDay = selectDay;
    focusedDay = focusDay;
    notifyListeners();
  }

  calendarDayChange(context, day) {
    switch (day.weekday) {
      case 1:
        return const Center(child: Text('월'),);
      case 2:
        return const Center(child: Text('화'),);
      case 3:
        return const Center(child: Text('수'),);
      case 4:
        return const Center(child: Text('목'),);
      case 5:
        return const Center(child: Text('금'),);
      case 6:
        return const Center(
          child: Text('토', style: TextStyle(color: Colors.red),),);
      case 7:
        return const Center(
          child: Text('일', style: TextStyle(color: Colors.red),),);
    }
  }
  void onFormatChanged(format) {
    calendarFormat = format;
    notifyListeners();
}
}