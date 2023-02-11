import 'package:flutter/material.dart';

double horizontalPadding = 20.0;
double hs1 = 10.0;
double vs1 = 10.0;
double vs2 = 20.0;
double radius = 20.0;

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  var padding = MediaQuery.of(context).viewPadding;
  height = height -
      padding.top -
      padding.bottom -
      kToolbarHeight -
      kBottomNavigationBarHeight;
  return height;
}

Widget horizontalSpacing(double width) {
  return SizedBox(
    width: width,
  );
}

Widget verticalSpacing(double height) {
  return SizedBox(
    height: height,
  );
}
