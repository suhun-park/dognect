import 'package:dognect/common/color/color.dart';
import 'package:dognect/common/view/root_tab.dart';
import 'package:dognect/home/layout/home_drawer.dart';
import 'package:dognect/home/layout/home_layout.dart';
import 'package:dognect/home/view/faq/view/faq_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: APPBAR_COLOR,
          centerTitle: false,
          title: const Text("애교강아지",style: TextStyle(fontSize: 20),),
        ),
      ),
      body: const HomeItemBody(),
      endDrawer: const HomeDrawer()
    );
  }
}
class HomeItemBody extends StatelessWidget {
  const HomeItemBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      HomeLayout(
      iconItem: const [
        Icon(Icons.add),
        Icon(Icons.abc)
      ],
        )
        ],
    );
  }
}

