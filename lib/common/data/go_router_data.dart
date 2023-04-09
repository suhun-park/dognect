import 'package:dognect/common/page/chat_gpt/view/chat_gpt_screen.dart';
import 'package:dognect/common/view/splash_screen.dart';
import 'package:dognect/home/view/home_screen.dart';
import 'package:dognect/notice/page/page/notice_detail_write_screen.dart';
import 'package:dognect/notice/page/view/notice_detail_screen.dart';
import 'package:dognect/user/login/kakao/view/kakao_user_signup_screen.dart';
import 'package:dognect/user/login/provider/teacher/teacher_signup_provider.dart';
import 'package:dognect/user/login/view/login_choice_role_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';


import '../../notice/page/view/album_detail_screen.dart';
import '../../notice/page/view/teacher_talk_detail_screen.dart';
import '../../user/login/view/login_first_screen.dart';
import '../../user/login/view/teacher/teacher_signup_screen.dart';
import '../../user/login/view/user/user_login_parents_profile_screen.dart';
import '../../user/login/view/user/user_signup_screen.dart';
import '../page/calendar/view/calendar_screen.dart';
import '../view/root_tab.dart';

class RouterData extends ChangeNotifier {
  final GoRouter routerData = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/rootTab',
      builder: (BuildContext context, GoRouterState state) {
        return const RootTab();
      },
    ),
    GoRoute(
        path: '/loginFirstScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginFirstScreen();
        }),
    GoRoute(
      path: '/homeScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/userSignUpScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const UserSignUpScreen();
      },
    ),
    GoRoute(
      path: '/userLoginParentsProfileScreen',
      builder: (BuildContext context, GoRouterState state) {
        return UserLoginParentsProfileScreen();
      },
    ),
    GoRoute(
      path: '/loginChoiceRoleScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginChoiceRoleScreen();
      },
    ),
    GoRoute(path: '/teacherSignUpScreen',
      builder: (BuildContext context, GoRouterState state) {
        return  const TeacherSignupScreen();
      },
    ),
    GoRoute(
      path: '/calendarScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const CalendarScreen();
      },
    ),
    GoRoute(
      path: '/noticeDetailScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const NoticeDetailScreen();
      },
    ),
    GoRoute(
      path: '/teacherTalkDetailScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const TeacherTalkDetailScreen();
      },
    ),
    GoRoute(
      path: '/albumDetailScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const AlbumDetailScreen();
      },
    ),
    GoRoute(
      path: '/noticeDetailWriteScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const NoticeDetailWriteScreen();
      },
    ),
    GoRoute(
      path: '/kakaoUserSignUpScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const KakaoUserSignUpScreen();
      },
    ),
    GoRoute(
      path: '/chatGptScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const ChatGptScreen();
      },
    ),

  ]);
}
