import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/behavior.dart';
import 'package:fluttergram/widgets/bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  static String route = "/feed";

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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: Key('home_view'),
      appBar: AppBar(
        title: Text(
          "Home",
          textAlign: TextAlign.center,
        ),
        leading: SizedBox(),
      ),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.home),
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
