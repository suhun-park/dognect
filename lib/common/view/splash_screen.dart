import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import '../../user/login/component/data/data.dart';
import '../../user/login/view/login_profile_screen.dart';
import 'root_tab.dart';
import '../layout/default_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  final storage = FlutterSecureStorage();
  void initState() {
    super.initState();
    checkToken();
  }
  void checkToken() async{
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken  = await storage.read(key: ACCESS_TOKEN_KEY);
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      final url = Uri.https('kapi.kakao.com', '/v2/user/me');

      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
        },
      );
      final profileInfo = json.decode(response.body);
      await storage.write(key: ACCESS_TOKEN_KEY, value: token.accessToken);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => LoginProfile()), (route) => false);
    }catch(e) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (_) => LoginProfile()),
              (route) => false);
    }
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
