import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoticeCalendarProvider with ChangeNotifier{
  String formatData = '';
  DateTime onDate = DateTime.now();
   void onDateSelected (date) {
    onDate = date;
    formatData = DateFormat('yyyy-MM-dd EEEE','ko').format(onDate).toString();
  }
}