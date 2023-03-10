import 'package:dognect/common/view/splash_screen.dart';
import 'package:dognect/home/view/home_screen.dart';
import 'package:dognect/user/login/view/login_choice_role_screen.dart';
import 'package:dognect/user/login/view/login_parents_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../user/login/view/login_first_screen.dart';
import '../../user/login/view/sign_up_screen.dart';

class RouterData extends ChangeNotifier {
  final GoRouter routerData = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
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
      path: '/signUpScreen',
      builder: (BuildContext context, GoRouterState state) {
        return SignUpScreen();
      },
    ),
    GoRoute(
      path: '/loginParentsProfileScreen',
      builder: (BuildContext context, GoRouterState state) {
        return LoginParentsProfileScreen();
      },
    ),
    GoRoute(
      path: '/loginChoiceRoleScreen',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginChoiceRoleScreen();
      },
    ),
  ]);
}
