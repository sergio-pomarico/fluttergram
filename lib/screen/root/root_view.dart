import 'package:flutter/material.dart';
import 'package:fluttergram/screen/auth/auth_view.dart';
import 'package:fluttergram/screen/walkthrough/walkthrough_view.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fluttergram/bloc/auth/auth_bloc.dart';

class RootScreen extends StatefulWidget {
  static String route = "/root";

  _RootState createState() => _RootState();
}

class _RootState extends State<RootScreen> {
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    final authBloc = BlocProvider.of<AuthBloc>(context);
    bool isAuthenticated = authBloc.state.authenticated;

    preferences.then((SharedPreferences prefs) {
      if (!prefs.containsKey('walkthrough_viewed')) {
        NavigationService.replace(
            context: context, route: WalkthroughScreen.route);
      } else {
        if (isAuthenticated) {
          //TODO go to Home
        } else {
          NavigationService.replace(context: context, route: LoginScreen.route);
        }
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
