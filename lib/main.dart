import 'package:dognect/common/data/go_router_data.dart';
import 'package:dognect/common/provider/splash_provider.dart';
import 'package:dognect/common/provider/tab_controller.dart';
import 'package:dognect/common/view/splash_screen.dart';
import 'package:dognect/common/view/root_tab.dart';
import 'package:dognect/home/provider/home_provider.dart';
import 'package:dognect/user/login/provider/kpostal_provider.dart';
import 'package:dognect/user/login/provider/login_first_provider.dart';
import 'package:dognect/user/login/provider/login_parents_profile_provider.dart';
import 'package:dognect/user/login/provider/role_provider.dart';
import 'package:dognect/user/login/provider/sign_up_provider.dart';
import 'package:dognect/user/login/view/login_first_screen.dart';
import 'package:dognect/user/login/view/login_parents_profile_screen.dart';
import 'package:dognect/user/provider/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'home/view/home_screen.dart';

void main() async {
  KakaoSdk.init(
      nativeAppKey: 'cabe22c5b77d5ccb76329f385f2251c9',
      javaScriptAppKey: '5c27f040a4944296c9d6b5586c9360b2');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RouterData()),
        ChangeNotifierProvider(create: (_) => RoleProvider()),
        ChangeNotifierProvider(create: (_) => KpostalProvider()),
        ChangeNotifierProvider(create: (_) => LoginFirstProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => LoginParentsProfileProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => RootTabController()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],child:MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goRouterData = Provider.of<RouterData>(context);
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          routerConfig: goRouterData.routerData,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
