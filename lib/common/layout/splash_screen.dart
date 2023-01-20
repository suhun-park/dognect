import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../view/root_tab.dart';
import 'default_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Timer(const Duration(milliseconds: 1000), () =>
        Get.to(() =>RootTab()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        backgroundColor: Colors.white,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/splash.png',
                width: MediaQuery.of(context).size.width/2,
              ),
              SizedBox(height: 12.0,),
              Text("Dog Note",style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold,fontFamily: 'fonts'),),
              CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          ),
        ));

  }
}
