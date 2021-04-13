import 'package:flutter/material.dart';

import 'package:fluttergram/screen/walkthrough/walkthrough_view.dart';
import 'package:fluttergram/screen/auth/login_view.dart';
import 'package:fluttergram/screen/auth/forgot_password.dart';
import 'package:fluttergram/screen/auth/signin_view.dart';
import 'package:fluttergram/screen/auth/complete_info_view.dart';

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
      ForgotPasswordScreen.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: ForgotPasswordScreen.route),
        builder: (_) => ForgotPasswordScreen(),
      ),
      SigninScreen.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: SigninScreen.route),
        builder: (_) => SigninScreen(),
      ),
      CompleteUserInfoScreen.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: CompleteUserInfoScreen.route),
        builder: (_) => CompleteUserInfoScreen(),
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
