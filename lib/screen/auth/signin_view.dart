import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/behavior.dart';

import 'package:fluttergram/widgets/input/input.dart';
import 'package:fluttergram/widgets/social_button.dart';
import 'package:fluttergram/widgets/input/validator.dart';
import 'package:fluttergram/widgets/button.dart';

import 'package:fluttergram/screen/auth/complete_info_view.dart';

class SigninScreen extends StatelessWidget {
  static String route = "/signIn";

  void goTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: Key('signin_view'),
      appBar: AppBar(
        title: Text(
          "Register",
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
                "Register Account",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
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
                        error: null,
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Input(
                        label: 'Password',
                        placeholder: 'Enter your password',
                        controller: TextEditingController(),
                        isPassword: true,
                        icon: Icons.lock_outline,
                        error: null,
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Input(
                        label: 'Confirm Password',
                        placeholder: 'Repeat your password',
                        controller: TextEditingController(),
                        isPassword: true,
                        icon: Icons.lock_outline,
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Button(
                          text: 'Continue',
                          onPress: () => goTo(
                                context,
                                CompleteUserInfoScreen.route,
                              )),
                      SizedBox(
                        height: getProportionateScreenHeight(40),
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
                      Text(
                        'By continuing your confirm that you agree \nwith our Term and Condition',
                        textAlign: TextAlign.center,
                      )
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
