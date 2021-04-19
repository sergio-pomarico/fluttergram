/// [flutter-packages]
import 'package:flutter/material.dart';

class NavigationService {
  static void push({BuildContext context, String route, dynamic params}) {
    Navigator.pushNamed(
      context,
      route,
      arguments: params,
    );
  }

  static void replace({BuildContext context, String route, dynamic params}) {
    Navigator.pushReplacementNamed(
      context,
      route,
      arguments: params,
    );
  }

  static void removeHistory(BuildContext context) {
    while (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  static void popAndPush({BuildContext context, String route}) {
    Navigator.popAndPushNamed(context, route);
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
