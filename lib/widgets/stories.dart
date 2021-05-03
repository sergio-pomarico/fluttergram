import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

class Stories extends StatelessWidget {
  final String text;
  final String image;

  Stories({
    this.text,
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 17.0, right: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade800,
                  spreadRadius: 2,
                  blurRadius: 2,
                ),
              ],
              shape: BoxShape.circle,
              color: Color(0xFFF5F6F9),
            ),
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              maxRadius: 35,
              backgroundImage: NetworkImage(image),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.008),
          Text(
            text,
            style: TextStyle(
              color: secondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
