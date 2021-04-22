import 'package:flutter/material.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/screen/auth/auth_view.dart';
import 'package:fluttergram/screen/walkthrough/walkthrough_view.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootScreen extends StatefulWidget {
  static String route = "/root";

  _RootState createState() => _RootState();
}

class _RootState extends State<RootScreen> {
  final NavigationService navigator = locator<NavigationService>();
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    preferences.then((SharedPreferences prefs) {
      if (!prefs.containsKey('walkthrough_viewed')) {
        navigator.replace(navigator.navigatorKey,
            route: WalkthroughScreen.route);
      } else {
        navigator.replace(navigator.navigatorKey, route: AuthScreen.route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('root_view'),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          ),
        ),
      ),
    );
  }
}
