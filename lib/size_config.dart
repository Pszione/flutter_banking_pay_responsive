import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData? _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  SizeConfig init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;

    print('Initialized SizeConfig()');
    return this;
  }

  double getProportionateScreenWidth(double inputWidth) {
    // 375 is the layout width that designers use
    return (inputWidth / 375) * SizeConfig.screenWidth;
  }

  double getProportionateScreenHeight(double inputHeight) {
    // 812 is the layout height that designer use
    return (inputHeight / 812) * SizeConfig.screenHeight;
  }
}
