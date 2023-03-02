import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common/color/color.dart';

import '../../user/login/component/social_login.dart';
import '../../user/login/model/kakao_model.dart';
import '../view/faq/view/faq_screen.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final viewModel = KakaoModel(KakaoLogin());
  @override
  Widget build(BuildContext context) {
    //홈의 메뉴 부분
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
            accountEmail: Text("${viewModel.user?.kakaoAccount?.email}",style: TextStyle(fontSize: 15),), //수정 값을 받아야함
            onDetailsPressed: (){ //펼쳐지게끔
              setState(() {

              });
            },
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/img/수훈이와주현이.jpeg'), //수정 값을 받아야함
            ),
            otherAccountsPictures: const [
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
            onTap: () => Get.to(() =>FaqScreen()),

            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(Icons.question_answer,color: Colors.grey[850],),
            title: Text('FAQ'),
            onTap: (){
              viewModel.logout();
              print("${viewModel.isLogined}");
            },
            trailing: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
