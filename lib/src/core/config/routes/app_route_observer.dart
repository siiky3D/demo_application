import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint('🚀 Pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint('👋 Popped: ${route.settings.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    if (previousRoute != null) {
      super.didChangeTabRoute(route, previousRoute);
    }
    debugPrint('📌 Tab Changed: ${route.name}');
  }
}
