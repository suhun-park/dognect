import 'package:flutter/cupertino.dart';

class TabProvider with ChangeNotifier{
  int controllerIndex = 0;
  void tabIndexController(int index) {
    controllerIndex = index;
    notifyListeners();
  }


}