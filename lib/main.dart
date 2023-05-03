import 'package:dognect/common/data/go_router_data.dart';
import 'package:dognect/common/page/chat_gpt/provider/chat_gpt_provider.dart';
import 'package:dognect/common/provider/splash_provider.dart';
import 'package:dognect/home/provider/ad_carousel_slider_provider.dart';
import 'package:dognect/home/provider/tab_button_provider.dart';
import 'package:dognect/common/provider/tab_pvrovider.dart';
import 'package:dognect/home/provider/home_provider.dart';
import 'package:dognect/notice/page/provider/album_detail_provider.dart';
import 'package:dognect/notice/page/provider/teacher_talk_detail_provider.dart';
import 'package:dognect/notice/provider/notice_calendar_provider.dart';
import 'package:dognect/notice/provider/notice_provider.dart';
import 'package:dognect/noticeboard/page/freeboard/provider/free_board_provider.dart';
import 'package:dognect/noticeboard/page/freeboard/provider/free_board_write_provider.dart';
import 'package:dognect/user/login/kakao/provider/kakao_user_check_provider.dart';
import 'package:dognect/user/login/provider/teacher/kpostal_provider.dart';
import 'package:dognect/user/login/provider/login_first_provider.dart';
import 'package:dognect/user/login/provider/role_provider.dart';
import 'package:dognect/user/login/provider/teacher/teacher_signup_provider.dart';
import 'package:dognect/user/login/provider/user/user_login_parents_profile_provider.dart';
import 'package:dognect/user/login/provider/user/user_signup_provider.dart';
import 'package:dognect/user/provider/teacher_provider.dart';
import 'package:dognect/user/provider/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

import 'common/page/calendar/provider/calendar_provider.dart';
import 'common/page/calendar/provider/modal_bottom_sheet_provider.dart';
import 'firebase_options.dart';
import 'myuser/provider/my_user_provider.dart';
import 'notice/page/provider/notice_detail_provider.dart';

void main() async {
  KakaoSdk.init(
      nativeAppKey: 'cabe22c5b77d5ccb76329f385f2251c9',
      javaScriptAppKey: '5c27f040a4944296c9d6b5586c9360b2');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RouterData()),
        ChangeNotifierProvider(create: (_) => RoleProvider()),
        ChangeNotifierProvider(create: (_) => KpostalProvider()),
        ChangeNotifierProvider(create: (_) => LoginFirstProvider()),
        ChangeNotifierProvider(create: (_) => UserSignUpProvider()),
        ChangeNotifierProvider(create: (_) => UserLoginParentsProfileProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => TabProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => TabButtonProvider()),
        ChangeNotifierProvider(create: (_) => AdCarouselSliderProvider()),
        ChangeNotifierProvider(create: (_) => TeacherProvider()),
        ChangeNotifierProvider(create: (_) => TeacherSignupProvider()),
        ChangeNotifierProvider(create: (_) => CalendarProvider()),
        ChangeNotifierProvider(create: (_) => ModalBottomSheetProvider()),
        ChangeNotifierProvider(create: (_) => NoticeCalendarProvider()),
        ChangeNotifierProvider(create: (_) => NoticeProvider()),
        ChangeNotifierProvider(create: (_) => NoticeDetailProvider()),
        ChangeNotifierProvider(create: (_) => AlbumDetailProvider()),
        ChangeNotifierProvider(create: (_) => TeacherTalkDetailProvider()),
        ChangeNotifierProvider(create: (_)=>KakaoUserCheckProvider()),
        ChangeNotifierProvider(create: (_) => MyUserProvider()),
        ChangeNotifierProvider(create: (_) => ChatGptProvider()),
        ChangeNotifierProvider(create: (_) => FreeBoardProvider()),
        ChangeNotifierProvider(create: (_) => FreeBoardWriteProvider()),
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
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ko'),
            Locale('KR'),
          ],
          routerConfig: goRouterData.routerData,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
