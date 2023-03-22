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
  List<String> colorName = ['빨간색','파랑색','연초록색','보라색','노랑색'];
  TextEditingController memoController = TextEditingController();
  String userColor = '';
  String userColorName = '';

  String startSelectedTime = '';
  String finalSelectedTime = '';
  final memoFormKey = GlobalKey<FormState>();
  String memoValue = '';
  int? startH = 0;
  int? startM = 0;
  int? finalH = 0;
  int? finalM = 0;

  void colorValue (index) {
    userColor = colorSelect[index].toString().substring(6,  colorSelect[index].toString().length - 1);
    userColorName = colorName[index].toString();

    notifyListeners();
  }


  Future<void> startShowPicker(BuildContext context) async {
    Future<TimeOfDay?> selectedTime = showTimePicker(context: context, initialTime: TimeOfDay.now());


    selectedTime.then((timeOfDay){
      startSelectedTime = '${timeOfDay?.hour} : ${timeOfDay?.minute}';
      notifyListeners();
      startH = timeOfDay?.hour;
      startM = timeOfDay?.minute;
      return startSelectedTime;
    });
  }
  Future<void> finalShowPicker(BuildContext context) async {
    Future<TimeOfDay?> selectedTime = showTimePicker(context: context, initialTime: TimeOfDay.now());

    try{
      selectedTime.then((timeOfDay){
        finalSelectedTime = '${timeOfDay?.hour} : ${timeOfDay?.minute}';
        finalH = timeOfDay?.hour;
        finalM = timeOfDay?.minute;
        if((startH! > finalH!) ||(startH! == finalH! && startM!>finalM!) ||(startH ==0 && startM ==0)){
          return null;
        }else{
          notifyListeners();
          return finalSelectedTime;

        }
      });
    }catch(e){
      return print(e);

    }
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

  void dataSave(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final calendarProvider = Provider.of<CalendarProvider>(context, listen: false);
    try{
      if (memoFormKey.currentState?.validate() != false) {

      await FirebaseFirestore.instance.collection('memo').doc(
          '${userProvider.userMyModelData[0].uid}$startSelectedTime').set(
        {
          'uid' : userProvider.userMyModelData[0].uid,
          'firstTime': startSelectedTime,
          'finalTime': finalSelectedTime,
          'memo': memoValue,
          'color': userColor,
          'dateTime' : calendarProvider.selectChangedDay,
        },
      );
    }
      calendarProvider.getMemoData(context);
      context.pop();
    }catch(e){
      print(e);
    }
    }
  }
