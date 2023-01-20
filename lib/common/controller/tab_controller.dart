import 'package:get/get.dart';

class RootTabController extends GetxController{
  RxInt tabIndex = 0.obs;
  void tabIndexController(int index) {
    tabIndex(index);
  }
}