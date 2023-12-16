
import 'package:custom_theme/injection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../application/advice/cubit/advicer_cubit.dart';
import '../presentation/advice/advice_page.dart';
import '../presentation/reative_login/login_page.dart';
import 'gorouter_observer.dart';


final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
    const String _basePath = '/presentation';
final routes = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '$_basePath${AdvicePage.routeName}',
    observers: [
      GoRouterObserver()
    ],
    routes: [
      GoRoute(
        name: AdvicePage.routeName,
          path: '$_basePath${AdvicePage.routeName}',
          builder: (context, state) =>  AdvicePage(adviceCubit: sl<AdviceCubit>())),
     GoRoute(
        name: LoginPage.routeName,
          path: '$_basePath${LoginPage.routeName}',
          builder: (context, state) =>  const LoginPage()),

      
    ]);