/// [flutter-packages]
import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> authNavigatorKey =
      new GlobalKey<NavigatorState>();

  void push(GlobalKey<NavigatorState> navKey,
      {BuildContext context, String route, dynamic params}) {
    if (navKey == null) navKey = navigatorKey;
    navKey.currentState.pushNamed(
      route,
      arguments: params,
    );
  }

  void replace(GlobalKey<NavigatorState> navKey,
      {String route, dynamic params}) {
    if (navKey == null) navKey = navigatorKey;
    navKey.currentState.pushReplacementNamed(
      route,
      arguments: params,
    );
  }

  void removeHistory(GlobalKey<NavigatorState> navKey) {
    if (navKey == null) navKey = navigatorKey;
    while (navigatorKey.currentState.canPop()) {
      navigatorKey.currentState.pop();
    }
  }

  void popAndPush(GlobalKey<NavigatorState> navKey, {String route}) {
    if (navKey == null) navKey = navigatorKey;
    navigatorKey.currentState.popAndPushNamed(route);
  }

  void goBack(GlobalKey<NavigatorState> navKey, dynamic params) {
    if (navKey == null) navKey = navigatorKey;
    navigatorKey.currentState.pop(params);
  }
}
