import 'package:flutter/material.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/screen/create/create_post_view.dart';
import 'package:fluttergram/screen/home/home_view.dart';
import 'package:fluttergram/screen/profile/profile_view.dart';
import 'package:fluttergram/ui_shared/images.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

enum MenuState { home, favourite, message, profile }

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;
  final NavigationService navigator = locator<NavigationService>();

  void onPressCreatePost() {
    navigator.push(navigator.navigatorKey, route: CreatePostScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: ImageFactory.svg(
                'assets/icons/home.svg',
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenWidth(32),
                color: MenuState.home == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
              ),
              onPressed: () => navigator.push(navigator.navigatorKey,
                  route: HomeScreen.route),
            ),
            IconButton(
              icon: ImageFactory.svg(
                'assets/icons/heart.svg',
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenWidth(32),
                color: MenuState.favourite == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {},
            ),
            InkWell(
              onTap: onPressCreatePost,
              child: SizedBox(
                height: getProportionateScreenHeight(48),
                width: getProportionateScreenWidth(48),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: ImageFactory.svg(
                'assets/icons/chat.svg',
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenWidth(32),
                color: MenuState.message == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: ImageFactory.svg(
                'assets/icons/user.svg',
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenWidth(32),
                color: MenuState.profile == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
              ),
              onPressed: () => navigator.push(navigator.navigatorKey,
                  route: ProfileScreen.route),
            ),
          ],
        ),
      ),
    );
  }
}
