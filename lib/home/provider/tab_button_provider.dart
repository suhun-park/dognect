import 'package:flutter/cupertino.dart';

class TabButtonProvider with ChangeNotifier{
  int tabButtonIndex = 0 ;

  void oneTabIndex () {
    tabButtonIndex = 0;
    notifyListeners();
  }
  void twoTabIndex() {
    tabButtonIndex = 1 ;
    notifyListeners();
  }
}