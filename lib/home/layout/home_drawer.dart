import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/color/color.dart';
import '../view/faq/view/faq_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: APPBAR_COLOR,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
            accountName: Text('애교많은 강아지',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),), //수정 값을 받아와야함
            accountEmail: Text('suhunhope@naver.com',style: TextStyle(fontSize: 15),), //수정 값을 받아야함
            onDetailsPressed: (){ //펼쳐지게끔
              print('arrow is clicked');
            },
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/img/수훈이와주현이.jpeg'), //수정 값을 받아야함
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/img/수훈이와주현이.jpeg'), //수정 값을 받아야함
              )
            ],
          ),
          ListTile(
            leading: Icon(Icons.home,color: Colors.grey[850],),
            title: Text('홈'),
            onTap: (){
              Get.back();
            },
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.grey[850],),
            title: Text('설정'),
            onTap: () => Get.to(FaqScreen()),

            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(Icons.question_answer,color: Colors.grey[850],),
            title: Text('FAQ'),
            onTap: (){
              print('QnA is clicked');
            },
            trailing: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
