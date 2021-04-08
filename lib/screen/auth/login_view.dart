import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/behavior.dart';

import 'package:fluttergram/widgets/input/input.dart';
import 'package:fluttergram/widgets/social_button.dart';
import 'package:fluttergram/widgets/input/validator.dart';
import 'package:fluttergram/widgets/button.dart';

class LoginScreen extends StatelessWidget {
  static String route = "/login";

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
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Form(
                child: Padding(
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
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Input(
                        label: 'Password',
                        placeholder: 'Enter your password',
                        controller: TextEditingController(),
                        isPassword: true,
                        icon: Icons.lock_outline,
                        suffix: InkWell(
                          key: Key('password_icon_button'),
                          onTap: () {},
                          child: Icon(
                            true ? Icons.brightness_1_outlined : Icons.block,
                            color: primaryColor,
                          ),
                        ),
                        error: 'error password',
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
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                      Button(text: 'Sign In', onPress: () {}),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     SocialButton(
                      //       icon: "assets/icons/google-icon.svg",
                      //       onPress: () {},
                      //     ),
                      //     SocialButton(
                      //       icon: "assets/icons/facebook-2.svg",
                      //       onPress: () {},
                      //     ),
                      //     SocialButton(
                      //       icon: "assets/icons/twitter.svg",
                      //       onPress: () {},
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
