import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/images.dart';

class SocialButton extends StatelessWidget {
  SocialButton({@required this.icon, @required this.onPress, Key key})
      : super(key: key);

  final String icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        height: getProportionateScreenHeight(48),
        width: getProportionateScreenWidth(48),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            child: ImageFactory.svg(
              icon,
              height: getProportionateScreenHeight(32),
              width: getProportionateScreenWidth(32),
            ),
          ),
        ), //SvgPicture.asset(icon),
      ),
    );
  }
}
