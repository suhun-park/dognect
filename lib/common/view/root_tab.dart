/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../home/view/home_screen.dart';
import '../controller/tab_controller.dart';
import '../layout/default_layout.dart';



class RootTab extends GetView<RootTabController> {
  const RootTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>DefaultLayout(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap:controller.tabIndexController,
        currentIndex: controller.tabIndex.value,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_outlined), label: '게시판'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: '내정보'),

        ],

      ),
      child: IndexedStack(
        index: controller.tabIndex.value,
        children:const [
          HomeScreen(),
          Center(child: Text("게시판"),),
          Center(child: Text("내정보"),)
        ],
      ),
    )
    );
  }
}*/
