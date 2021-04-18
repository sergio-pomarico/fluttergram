import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/behavior.dart';

import 'package:fluttergram/widgets/input/input.dart';
import 'package:fluttergram/widgets/button.dart';

class CompleteUserInfoScreen extends StatefulWidget {
  static String route = "/complete_info";

  void goTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  _CompleteUserInfoState createState() => _CompleteUserInfoState();
}

class _CompleteUserInfoState extends State<CompleteUserInfoScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  String nameError;
  String lastnameError;
  String phoneError;
  String addressError;

  void validateName(String _) {
    setState(() {
      nameError = (name.text.length < 3 && name.text.length > 50)
          ? 'the name must be a minimum of 3 characters and a maximum of 60'
          : null;
    });
  }

  void validateLastName(String _) {
    setState(() {
      nameError = (lastname.text.length < 3 && lastname.text.length > 50)
          ? 'the lastname must be a minimum of 3 characters and a maximum of 60'
          : null;
    });
  }

  void validatePhone(String _) {
    setState(() {
      nameError = (phone.text.length < 7 && phone.text.length > 10)
          ? 'invalid phone number'
          : null;
    });
  }

  void validateAddress(String _) {
    setState(() {
      nameError = address.text.isEmpty ? 'address is required' : null;
    });
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
                "Complete Profile",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Complete your details",
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
                        controller: name,
                        error: nameError,
                        onChange: validateName,
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Input(
                        label: 'Lastname',
                        placeholder: 'Enter your lastame',
                        controller: lastname,
                        error: lastnameError,
                        onChange: validateLastName,
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Input(
                        label: 'Phone',
                        placeholder: 'Enter your phone',
                        controller: phone,
                        error: phoneError,
                        onChange: validatePhone,
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Input(
                        label: 'Address',
                        placeholder: 'Enter your address',
                        controller: address,
                        error: addressError,
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
