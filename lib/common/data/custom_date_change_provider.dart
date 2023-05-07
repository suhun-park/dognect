import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CustomDateChangeProvider with ChangeNotifier{
  DateTime? homeCustomDateTime = DateTime.now();
  String homeFormatDate = '';
  String year = DateTime.now().year.toString();
  String month = DateTime.now().month.toString();
  String day = DateTime.now().day.toString();
  String hour = DateTime.now().hour.toString();
  String minute = DateTime.now().minute.toString();
  String freeBoardDate = "";


  void homeCustomDateChange() { //요일만
    homeFormatDate = DateFormat('yyyy.MM.dd EEEE','ko').format(homeCustomDateTime!).toString();
  }
  void freeBoardDateChange() {
    freeBoardDate = '$year-$month-$day-$hour-$minute';
  }

}