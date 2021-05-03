import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

class InputSearch extends StatefulWidget {
  @override
  _InputSearchState createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(
        padding: EdgeInsets.fromLTRB(17, 0, 17, 0),
        child: TextField(
          decoration: InputDecoration(
            isCollapsed: false,
            border: UnderlineInputBorder(),
            prefixIcon: Icon(Icons.search),
            hintStyle: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              fontWeight: FontWeight.w800,
              color: secondaryColor,
            ),
            hintText: "Search",
            fillColor: Colors.grey.shade100,
            filled: true,
          ),
          textAlignVertical: TextAlignVertical.bottom,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.bold,
            color: secondaryColor,
          ),
        ),
      ),
    );
  }
}
