import 'package:flutter/material.dart';
import 'package:fluttergram/screen/root/root_view.dart';

import 'package:fluttergram/screen/walkthrough/walkthrough_view.dart';
import 'package:fluttergram/screen/auth/auth_view.dart';

class UIRouter {
  static String initialRoute = RootScreen.route;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, Route<dynamic>> appRouting = <String, Route<dynamic>>{
      RootScreen.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: RootScreen.route),
        builder: (_) => RootScreen(),
      ),
      WalkthroughScreen.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: WalkthroughScreen.route),
        builder: (_) => WalkthroughScreen(),
      ),
      AuthView.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: AuthView.route),
        builder: (_) => AuthView(),
      ),
    };

    return appRouting[settings.name] ??
        MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
  }
}
