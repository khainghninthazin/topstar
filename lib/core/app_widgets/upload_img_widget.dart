

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:top_star/controllers/checkout_controller.dart';

import '../constants/dimesions.dart';
import 'my_cache_img.dart';

class UploadImgWidget extends StatelessWidget {
  final CheckOutController controller;
  final Function()? onTap;
  final String? networkImg;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  const UploadImgWidget(
      {super.key,
      this.onTap,
      this.networkImg,
      this.width,
      this.boxFit,
      this.height, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [

          Container(
            height: height ?? Dimesion.height40 * 1.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimesion.radius15 / 2),
                border: Border.all(color: Colors.grey.shade100, width: 1),
                color: Colors.grey.shade100),
            child: controller.pickedImagePath == null && networkImg == null
                ? DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(6),
              child: Container(
                  width: width ?? Dimesion.screeWidth,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Click here image upload"),
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: Dimesion.iconSize25+17,
                      )
                    ],
                  )),
            )
                : controller.pickedImagePath != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(Dimesion.radius15 / 2),
              child: Image.file(
                controller.pickedImagePath!,
                fit: boxFit ?? BoxFit.cover,
                height: height ?? Dimesion.height40 * 1.5,
                width: width ?? Dimesion.screeWidth,
              ),
            ): MyCacheImg(
                height: height ?? Dimesion.height40 * 1.5,
                width: width ?? Dimesion.screeWidth,
                url: networkImg ?? "",
                boxfit: boxFit ?? BoxFit.cover,
                borderRadius: BorderRadius.circular(Dimesion.radius15 / 2)),
          ),
        ],
      ),
    );
  }
}
