
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../provider/calendar_provider.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarProvider = Provider.of<CalendarProvider>(context);
    return  SafeArea(
        child:Container(
          margin: EdgeInsets.fromLTRB(10, 0,0 , 0),
          child: TableCalendar(
            firstDay:DateTime.utc(2000,01,01),
            lastDay:DateTime.utc(2099,01,01),
            focusedDay:DateTime.now(),
            locale: 'ko-kr',
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
            onDaySelected: (DateTime selectDay,DateTime focusDay) => calendarProvider.calendarDayMangeMent(selectDay, focusDay),
            selectedDayPredicate: (day) => isSameDay(calendarProvider.selectedDay,day),
            calendarFormat: calendarProvider.calendarFormat,
            onFormatChanged:(format) => calendarProvider.onFormatChanged(format),
            onPageChanged: (focusedDay) => calendarProvider.focusedDay,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle
              ),

              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.0,
                  color: Colors.orange,
                ),
              ),
              outsideDecoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),

            ),
            calendarBuilders: CalendarBuilders(
              dowBuilder: (context, day) => calendarProvider.calendarDayChange(context, day)
            ),
          ),));;
  }
}
