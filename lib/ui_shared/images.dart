import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageFactory {
  static Widget fromAssets(
      {@required String asset,
      double height,
      double width,
      BoxFit fit = BoxFit.contain}) {
    if (asset.endsWith('svg')) {
      return svg(asset, width: width, height: height, fit: fit);
    }
    return Image.asset(
      asset,
      height: height,
      width: width,
      fit: fit,
    );
  }

  static Widget svg(
    String name, {
    double height,
    double width,
    BoxFit fit = BoxFit.contain,
    Color color,
    AlignmentGeometry alignment = Alignment.center,
  }) =>
      SvgPicture.asset(
        name,
        width: width,
        height: height,
        alignment: alignment,
        fit: fit,
        color: color,
      );
}
