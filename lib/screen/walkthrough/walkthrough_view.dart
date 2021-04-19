import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/images.dart';

import 'package:fluttergram/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fluttergram/screen/auth/auth_view.dart';

List<Map<String, String>> sliderData = [
  {
    "text": "Welcome to Fluttergram",
    "image": "assets/images/friends.svg",
  },
  {
    "text": "We help people conect with friends \naround the world",
    "image": "assets/images/vacations.svg"
  },
  {
    "text": "Meet interesting people\n and interact with them",
    "image": "assets/images/love.svg",
  },
];

class WalkthroughScreen extends StatefulWidget {
  static String route = "/walkthrough";

  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  int currentPage = 0;

  void goToLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('walkthrough_viewed', 'true');
    Navigator.pushNamed(context, LoginScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: Key('walkthroughScreen_view'),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: sliderData.length,
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    Spacer(),
                    Text(
                      "FLUTTERGRAM",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(36),
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      sliderData[index]['text'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(flex: 1),
                    ImageFactory.svg(
                      sliderData[index]['image'],
                      height: getProportionateScreenHeight(240),
                      width: getProportionateScreenWidth(320),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(24),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        sliderData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 1),
                    Button(text: "Next", onPress: goToLogin),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: animationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
