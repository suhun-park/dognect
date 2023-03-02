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
      body: Column(
        children: [
          Row(
            children: [
              Container(
              ),
            ],
          )

        ],
      ),
      //endDrawer: HomeDrawer()
    );
  }
}


