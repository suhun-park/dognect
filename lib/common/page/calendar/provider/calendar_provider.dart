import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../user/provider/user_provider.dart';

import '../model/memo_model.dart';

class CalendarProvider with ChangeNotifier {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String selectChangedDay = '';
  List<MemoModel> memoModelData = [];
  CalendarFormat calendarFormat = CalendarFormat.month;
  final StreamController<List<MemoModel>> _controller = StreamController.broadcast();
  Stream<List<MemoModel>> get memoDataStream => _controller.stream;
  Map<DateTime,List> events = {};
  DateTime dateParse = DateTime.now();


  void calendarDayMangeMent(DateTime selectDay, DateTime focusDay,BuildContext context) {
    selectedDay = selectDay;
    focusedDay = focusDay;
    notifyListeners();
    selectChangedDay = DateFormat('yyyy-MM-dd EEEE','ko').format(focusedDay);
    print(selectChangedDay);
    getMemoData(context);

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
  Future<List<MemoModel>> getMemoData(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final storage = FlutterSecureStorage();
    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection("memo");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await collectionReference.where('uid', isEqualTo: await userProvider.userMyModelData[0].uid,).where('dateTime',isEqualTo: selectChangedDay).orderBy('firstTime').get();
    memoModelData.clear();
    for (var element in querySnapshot.docs) {
      memoModelData.add(MemoModel.fromJson(element.data()));
    }
    notifyListeners();
    return memoModelData;
  }
  void init(BuildContext context) async {
    calendarDayMangeMent(selectedDay,focusedDay,context);
    await getMemoData(context);
  }
  void memoEventFunction() {
    for(var memo in memoModelData) {
      dateParse = DateTime.parse(memo.dateTime.toString());
    }
    print(dateParse);
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}