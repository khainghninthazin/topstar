import 'package:flutter/material.dart';

import '../constants/app_color.dart';

ThemeData myThemeData(BuildContext context) {
  return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.bgColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryClr),
      primaryColor: AppColor.primaryClr,
      dividerColor: Colors.transparent);
}
