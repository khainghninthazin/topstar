import 'package:flutter/material.dart';
import 'package:top_star/core/extension/text_theme_ext.dart';


import '../constants/app_color.dart';

class RowTextWidget extends StatelessWidget {
  final String title;
  final String val;
  const RowTextWidget({super.key, required this.title, required this.val});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.titleSmall,
        ),
        Expanded(
            flex: 1,
            child: Text(
          val,
          style: context.bodyLarge.copyWith(color: AppColor.black),
          textAlign: TextAlign.end,
        ))
      ],
    );
  }
}
