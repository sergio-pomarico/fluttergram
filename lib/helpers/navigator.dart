/// [flutter-packages]
import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  void push({BuildContext context, String route, dynamic params}) {
    navigatorKey.currentState.pushNamed(
      route,
      arguments: params,
    );
  }

  void replace({String route, dynamic params}) {
    navigatorKey.currentState.pushReplacementNamed(
      route,
      arguments: params,
    );
  }

  void removeHistory() {
    while (navigatorKey.currentState.canPop()) {
      navigatorKey.currentState.pop();
    }
  }

  void popAndPush({String route}) {
    navigatorKey.currentState.popAndPushNamed(route);
  }

  void goBack() {
    navigatorKey.currentState.pop();
  }
}
