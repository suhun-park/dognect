import 'package:flutter/cupertino.dart';

class RootTabController with ChangeNotifier{
  int controllerIndex = 0;
  void tabIndexController(int index) {
    controllerIndex = index;
    notifyListeners();
  }
}