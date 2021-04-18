import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/behavior.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttergram/widgets/input/input.dart';
import 'package:fluttergram/widgets/social_button.dart';
import 'package:fluttergram/widgets/input/validator.dart';
import 'package:fluttergram/widgets/button.dart';

import 'package:fluttergram/bloc/login/login_bloc.dart';

class HomeScreen extends StatefulWidget {
  static String route = "/login";

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String emailError;
  String passwordError;

  void goTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  void validateEmail(String _) {
    String error = InputValidator.validate(<InputValidatorType>[
      InputValidatorType.empty,
      InputValidatorType.email
    ], email.text);
    if (error != null) {
      setState(() {
        emailError = error;
      });
    } else {
      setState(() {
        emailError = null;
      });
    }
  }

  void validatePassword(String _) {
    setState(() {
      passwordError =
          password.text.length < 6 ? 'the password is too short' : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    //Add bloc provider to consume data
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      key: Key('home_view'),
      appBar: AppBar(
        title: Text(
          "Home",
          textAlign: TextAlign.center,
        ),
      ),
      body: ScrollConfiguration(
        behavior: NeverGrowthScroll(),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                "Home",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
