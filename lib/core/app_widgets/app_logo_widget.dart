import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/dimesions.dart';

class AppLogoWidget extends StatelessWidget {
  final Color? bgColor;
  const AppLogoWidget({super.key, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimesion.height40 * 1.5,
      decoration: BoxDecoration(
          color: bgColor ?? AppColor.primaryClr,
          shape: BoxShape.circle,
          image: const DecorationImage(
              image: AssetImage("assets/img/logo.png"))),
    );
  }
}
