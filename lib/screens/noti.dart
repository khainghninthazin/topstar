import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_star/core/app_widgets/back_button.dart';


import '../core/constants/app_color.dart';
import '../core/constants/dimesions.dart';

class NotiPage extends StatefulWidget {
  const NotiPage({super.key});

  @override
  State<NotiPage> createState() => _NotiPageState();
}

class _NotiPageState extends State<NotiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(Dimesion.radius15),
          ),
        ),
        toolbarHeight: Dimesion.screenHeight/11,
        leading: backButton(),
        backgroundColor: AppColor.primaryClr,
        centerTitle: true,
        title: Text("notification".tr,style: TextStyle(color: Colors.white,fontSize: Dimesion.font16,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
