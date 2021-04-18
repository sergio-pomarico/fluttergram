import 'package:flutter/material.dart';

// Override the normal vertical scroll behavior
class NeverGrowthScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;
}
