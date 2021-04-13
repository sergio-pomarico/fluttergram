import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/behavior.dart';

import 'package:fluttergram/widgets/input/input.dart';
import 'package:fluttergram/widgets/social_button.dart';
import 'package:fluttergram/widgets/input/validator.dart';
import 'package:fluttergram/widgets/button.dart';

import 'package:fluttergram/screen/auth/forgot_password.dart';
import 'package:fluttergram/screen/auth/signin_view.dart';

class LoginScreen extends StatefulWidget {
  static String route = "/login";

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
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
    return Scaffold(
      key: Key('login_view'),
      appBar: AppBar(
        title: Text(
          "Login",
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
                "Welcome Back",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Sign in with your email and password  \nor continue with social media",
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
                      controller: email,
                      icon: Icons.email_outlined,
                      onChange: validateEmail,
                      error: emailError,
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    Input(
                      label: 'Password',
                      placeholder: 'Enter your password',
                      controller: password,
                      isPassword: true,
                      icon: Icons.lock_outline,
                      error: passwordError,
                      onChange: validatePassword,
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          activeColor: primaryColor,
                          onChanged: (value) {},
                        ),
                        Text("Remember me"),
                        Spacer(),
                        InkWell(
                          onTap: () =>
                              goTo(context, ForgotPasswordScreen.route),
                          child: Text(
                            "Forgot Password",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Button(text: 'Sign In', onPress: () {}),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SocialButton(
                          icon: "assets/icons/google.svg",
                          onPress: () {},
                        ),
                        SocialButton(
                          icon: "assets/icons/facebook.svg",
                          onPress: () {},
                        ),
                        SocialButton(
                          icon: "assets/icons/twitter.svg",
                          onPress: () {},
                        ),
                      ],
                    ),
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
                          onTap: () => goTo(context, SigninScreen.route),
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
