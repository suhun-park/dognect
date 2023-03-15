import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dognect/common/data/color.dart';
import 'package:dognect/common/page/provider/calendar_provider.dart';
import 'package:dognect/user/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ModalBottomSheetProvider with ChangeNotifier{

  List<Color> colorSelect = [FIRST_COLOR,SECOND_COLOR,THIRD_COLOR,FOUR_COLOR,FIVE_COLOR];
  TextEditingController memoController = TextEditingController();
  String userColor = '';

  String startSelectedTime = '';
  String finalSelectedTime = '';
  final memoFormKey = GlobalKey<FormState>();
  String memoValue = '';

  void colorValue (index) {
    userColor = colorSelect[index].toString();
    notifyListeners();
  }


  Future<void> startShowPicker(BuildContext context) async {
    Future<TimeOfDay?> selectedTime = showTimePicker(context: context, initialTime: TimeOfDay.now());


    selectedTime.then((timeOfDay){
      startSelectedTime = '${timeOfDay?.hour} : ${timeOfDay?.minute}';
      notifyListeners();
      print(startSelectedTime);
      return startSelectedTime;
    });
  }
  Future<void> finalShowPicker(BuildContext context) async {
    Future<TimeOfDay?> selectedTime = showTimePicker(context: context, initialTime: TimeOfDay.now());


    selectedTime.then((timeOfDay){
      finalSelectedTime = '${timeOfDay?.hour} : ${timeOfDay?.minute}';
      notifyListeners();
      print(finalSelectedTime);
      return finalSelectedTime;
    });
  }
  void memoChanged(value) {
    memoValue = value;
    notifyListeners();
  }
  String? memoValidate(value) {
    if (value == null || value.isEmpty) {
      return '필수항목입니다';
    }
    return null;
  }

  Future<void> dataSave(BuildContext context) async {
    if (memoFormKey.currentState?.validate() != false) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final calendarProvider = Provider.of<CalendarProvider>(context, listen: false);
      await FirebaseFirestore.instance.collection('memo').doc(
          userProvider.userMyModelData[0].uid).set(
        {
          'firstTime': startSelectedTime,
          'finalTime': finalSelectedTime,
          'memo': memoValue,
          'color': userColor,
          'dateTime' : calendarProvider.selectChangedDay,
        },
      );
      context.pop();
    }
  }
}