import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/dimesions.dart';

class AppButtonWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;

  final double? minWidth;
  final double? borderRadius;
  final Color? color;
  final void Function()? onTap;
  final double? height;
  final Widget title;
  const AppButtonWidget(
      {super.key,
      this.borderRadius,
      this.color,
      this.onTap,
      this.height,
      this.minWidth,
      this.padding,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: height ?? Dimesion.height40,
            padding:
                padding ?? EdgeInsets.symmetric(horizontal: Dimesion.width10),
            width: minWidth ?? Dimesion.screeWidth,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: color ?? AppColor.primaryClr,
                borderRadius: BorderRadius.circular(
                    borderRadius ?? Dimesion.radius15 / 2)),
            child: title));
  }
}
