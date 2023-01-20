import 'package:dognect/common/layout/splash_screen.dart';
import 'package:dognect/common/view/root_tab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'common/controller/tab_controller.dart';
import 'firebase_options.dart';
import 'home/view/home_screen.dart';

void main() async{
  KakaoSdk.init(nativeAppKey: 'cabe22c5b77d5ccb76329f385f2251c9',javaScriptAppKey: '5c27f040a4944296c9d6b5586c9360b2');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "도그넷",
      debugShowCheckedModeBanner: false,
      /*theme: ThemeData(
        fontFamily: 'fonts',
      ),*/
      home: SplashScreen(),
      initialBinding: BindingsBuilder((){
        Get.put(RootTabController());
      }),
    );
  }
}
