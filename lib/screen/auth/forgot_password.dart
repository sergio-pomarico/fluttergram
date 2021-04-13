import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/behavior.dart';

import 'package:fluttergram/widgets/input/input.dart';
import 'package:fluttergram/widgets/input/validator.dart';
import 'package:fluttergram/widgets/button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String route = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: Key('forgot_password_view'),
      appBar: AppBar(
        title: Text(
          "Forgot Password",
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
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "Forgot Password",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Input(
                      label: 'Email',
                      placeholder: 'Enter your email',
                      controller: TextEditingController(),
                      icon: Icons.email_outlined,
                      validator: (String value) => InputValidator.validate(
                        <InputValidatorType>[
                          InputValidatorType.empty,
                          InputValidatorType.email
                        ],
                        value,
                      ),
                      error: null,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.15),
                    Button(text: 'Send', onPress: () {}),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(16)),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                                color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
