import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../constants/app_color.dart';


class MyCacheImg extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit boxfit;
  final BorderRadius borderRadius;
  const MyCacheImg(
      {super.key,
      required this.url,
      this.width,
      this.height,
      required this.boxfit,
      required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      alignment: Alignment.center,
      imageUrl: url,
      progressIndicatorBuilder: (context, url, progress) => Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const CupertinoActivityIndicator(
            color: AppColor.primaryClr,
            animating: true,
          )),
      errorWidget: (context, url, error) => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: borderRadius,
          ),
          child: const CupertinoActivityIndicator(
            color: AppColor.primaryClr,
            animating: true,
          )),
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: const DecorationImage(image: AssetImage('assets/img/banner.png'),fit: BoxFit.cover))
      ),
    );
  }
}
