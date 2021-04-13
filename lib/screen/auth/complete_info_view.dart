import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/behavior.dart';

import 'package:fluttergram/widgets/input/input.dart';
import 'package:fluttergram/widgets/input/validator.dart';
import 'package:fluttergram/widgets/button.dart';

class CompleteUserInfoScreen extends StatelessWidget {
  static String route = "/signIn";

  void goTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: Key('complete_info_view'),
      appBar: AppBar(
        title: Text(
          "Complete your info",
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
                        label: 'Name',
                        placeholder: 'Enter your email',
                        controller: TextEditingController(),
                        validator: (String value) => InputValidator.validate(
                          <InputValidatorType>[
                            InputValidatorType.empty,
                          ],
                          value,
                        ),
                        error: null,
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Input(
                        label: 'Lastname',
                        placeholder: 'Enter your lastame',
                        controller: TextEditingController(),
                        validator: (String value) => InputValidator.validate(
                          <InputValidatorType>[
                            InputValidatorType.empty,
                          ],
                          value,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Input(
                        label: 'Phone',
                        placeholder: 'Enter your phone',
                        controller: TextEditingController(),
                        validator: (String value) => InputValidator.validate(
                          <InputValidatorType>[
                            InputValidatorType.empty,
                          ],
                          value,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Input(
                        label: 'Address',
                        placeholder: 'Enter your address',
                        controller: TextEditingController(),
                        validator: (String value) => InputValidator.validate(
                          <InputValidatorType>[
                            InputValidatorType.empty,
                          ],
                          value,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Button(text: 'Continue', onPress: () {}),
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
