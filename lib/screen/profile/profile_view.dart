import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/behavior.dart';
import 'package:fluttergram/widgets/bottom_navbar.dart';
import 'package:fluttergram/widgets/profile_menu.dart';

class ProfileScreen extends StatefulWidget {
  static String route = "/profile";

  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
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
      key: Key('profile_view'),
      appBar: AppBar(
        title: Text(
          "Profile",
          textAlign: TextAlign.center,
        ),
        leading: SizedBox(),
      ),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.profile),
      body: ScrollConfiguration(
        behavior: NeverGrowthScroll(),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Center(
                child: SizedBox(
                  height: getProportionateScreenHeight(128),
                  width: getProportionateScreenWidth(136),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(128),
                        width: getProportionateScreenWidth(128),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F6F9),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.photo_rounded,
                            color: textColor,
                            size: 48,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 4,
                        bottom: 0,
                        child: SizedBox(
                          height: 46,
                          width: 46,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Color(0xFFF5F6F9),
                            ),
                            child: Icon(
                              Icons.add_a_photo,
                              color: textColor,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              ProfileMenu(
                text: "My Account",
                icon: "assets/icons/user.svg",
                press: () => {},
              ),
              ProfileMenu(
                text: "Notifications",
                icon: "assets/icons/bell.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Settings",
                icon: "assets/icons/settings.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Help Center",
                icon: "assets/icons/question.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/logout.svg",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
