import 'package:flutter/material.dart';

class GoRouterObserver extends NavigatorObserver{
   GoRouterObserver();
  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint(' did Pop => $previousRoute');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint(' didPush => $previousRoute');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
   debugPrint(' didRemove => $previousRoute');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
   debugPrint(' didReplace New Route $newRoute => Old Route $oldRoute');
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
   debugPrint(' didStartUserGesture $route => Old Route $previousRoute');
  }

  @override
  void didStopUserGesture() {
    debugPrint(' didStopUserGesture ');
  }

}