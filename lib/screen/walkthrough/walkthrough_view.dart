import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/images.dart';

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
    "text": "Welcome to Fluttergram",
    "image": "assets/images/friends.svg",
  },
];

class WalkthroughScreen extends StatefulWidget {
  static String routeName = "/walkthrough";

  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
                    ),
                    Spacer(flex: 2),
                    ImageFactory.svg(
                      sliderData[index]['image'],
                      height: getProportionateScreenHeight(320),
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
                  horizontal: getProportionateScreenWidth(20),
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
                    Expanded(
                      flex: 1,
                      child: LayoutBuilder(
                        builder: (BuildContext context,
                                BoxConstraints constraints) =>
                            SizedBox(
                          height: 60,
                          width: constraints.maxWidth,
                          child: TextButton(
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                color: Colors.white,
                              ),
                            ),
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: primaryColor),
                            onPressed: () {
                              //Navigator.pushNamed(context, SignInScreen.routeName);
                            },
                          ),
                        ),
                      ),
                    ),
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
