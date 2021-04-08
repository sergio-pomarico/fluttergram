import 'package:flutter/material.dart';

import './screen/walkthrough/walkthrough_view.dart';
import './screen/auth/login_view.dart';

class UIRouter {
  static String initialRoute = WalkthroughScreen.route;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, Route<dynamic>> appRouting = <String, Route<dynamic>>{
      WalkthroughScreen.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: WalkthroughScreen.route),
        builder: (_) => WalkthroughScreen(),
      ),
      LoginScreen.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: LoginScreen.route),
        builder: (_) => LoginScreen(),
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
