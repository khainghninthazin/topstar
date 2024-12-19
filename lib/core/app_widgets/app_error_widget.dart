import 'package:flutter/material.dart';
import 'package:top_star/core/extension/text_theme_ext.dart';


import '../constants/app_color.dart';
import '../constants/dimesions.dart';

class AppErrorWidget extends StatelessWidget {
  final void Function()? onPress;
  const AppErrorWidget({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Something Went Wrong",
          style: context.titleSmall,
        ),
        if (onPress != null)
          IconButton(
              onPressed: onPress,
              icon: Icon(
                Icons.refresh_rounded,
                color: AppColor.primaryClr,
                size: Dimesion.iconSize16,
              ))
      ],
    ));
  }
}
