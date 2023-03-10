import 'package:dognect/common/provider/tab_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/view/home_screen.dart';
import '../layout/default_layout.dart';



class RootTab extends StatelessWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootTabController = Provider.of<RootTabController>(context);
    return DefaultLayout(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap:(index) => rootTabController.controllerIndex,
        currentIndex: rootTabController.controllerIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_outlined), label: '게시판'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: '내정보'),

        ],

      ),
      child: IndexedStack(
        index: rootTabController.controllerIndex,
        children:const [
          HomeScreen(),
          Center(child: Text("게시판"),),
          Center(child: Text("내정보"),)
        ],
      ),
    );
  }
}
