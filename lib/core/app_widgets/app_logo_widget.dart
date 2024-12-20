import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/dimesions.dart';

class AppLogoWidget extends StatelessWidget {
  final Color? bgColor;
  const AppLogoWidget({super.key, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimesion.height40 * 3,
      decoration: BoxDecoration(
          color: bgColor ?? AppColor.bgColor,
          shape: BoxShape.circle,
          image: const DecorationImage(
              image: AssetImage("assets/image/loginregister_logo.png"))),
    );
  }
}
