import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../presentation/dashboard_screen/view/screen/DashBoardScreen.dart';

List<RouteBase> routes = [
  GoRoute(
    path: DashBoardScreen.route,
    name: DashBoardScreen.route,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      child: const DashBoardScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    ),
  ),
];
