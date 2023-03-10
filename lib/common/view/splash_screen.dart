import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dognect/common/data/color.dart';
import 'package:dognect/common/provider/splash_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';
import '../../user/login/component/data/data.dart';
import '../../user/login/view/login_parents_profile_screen.dart';
import 'root_tab.dart';
import '../layout/default_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final splashProvider = Provider.of<SplashProvider>(context);
    splashProvider.checkToken(context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        backgroundColor: BACKGROUND_COLOR,
        child: Center(child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/splash.png',
              width: 300.w,
              height: 300.h,
            ),
            SizedBox(height: 12.0,),
            Text("Dog Note",style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold,fontFamily: 'fonts'),),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        )));

  }
}
