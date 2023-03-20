import 'package:flutter/cupertino.dart';

class NoticeProvider with ChangeNotifier{
  bool isShow = false;

  void hideCallBack() {
    isShow = !isShow;
    notifyListeners();
  }
}