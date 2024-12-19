import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/dimesions.dart';

Widget backButton({Color? color}) => Container(
  decoration: BoxDecoration(
     
      borderRadius: BorderRadius.circular(Dimesion.radius5)
  ),
  child: IconButton(
    icon: Icon(Icons.arrow_back_ios,color: Colors.black87,size: Dimesion.iconSize25,),
    onPressed: () {
      Get.back();
    },
  ),
);



Widget backButtonBlack({Color? color}) => Container(
  padding: EdgeInsets.only(top: Dimesion.height15,bottom: Dimesion.height15,left: Dimesion.width10,right: Dimesion.width5),
  child: Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimesion.radius5)
    ),
    child: IconButton(
      icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,size: Dimesion.iconSize16,),
      onPressed: () {
        Get.back();
      },
    ),
  ),
);
