import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_star/controllers/product_controller.dart';
import 'package:top_star/core/app_data.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';

import '../../router/route_helper.dart';
import '../search_page.dart';

class ToolbarWidget extends StatelessWidget {
  final ProductController controller;
  const ToolbarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimesion.width10,
          right: Dimesion.width10,
          bottom: Dimesion.width10,
          top: Dimesion.width10),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/img/logo.png",
                ),
              ),
              Gap(Dimesion.width5),
              // Text(
              //   AppConfig.appName,
              //   style: GoogleFonts.outfit(textStyle:  TextStyle(color: Colors.red,fontSize: Dimesion.font16,fontWeight: FontWeight.bold)),
              // ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(5),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(Dimesion.size10)),
                // child: IconButton(
                //   icon: Icon(Icons.notifications,color: Colors.red,size: Dimesion.iconSize25,),
                //   onPressed: () {
                //     Get.toNamed(RouteHelper.noti);
                //   },
                // ),
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColor.primaryClr,
                    borderRadius: BorderRadius.circular(Dimesion.font12),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Favorite button action
                    },
                    icon:  Icon(
                      Icons.notifications,
                      size: Dimesion.size18,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          Gap(Dimesion.height10),
          Row(
            children: [
              Flexible(
                  child: InkWell(
                onTap: () {
                  Get.toNamed(RouteHelper.search,
                      arguments: SearchPage(
                        datalist: controller.allProducts,
                      ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(Dimesion.width10-2),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 5,
                            color: Colors.black12)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimesion.width10)),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.search,
                        size: Dimesion.iconSize16,
                        color: AppColor.primaryClr,
                      ),
                      Gap(Dimesion.width5),
                      Text(
                        "search".tr,
                        style: TextStyle(
                            color: Colors.grey, fontSize: Dimesion.font14),
                      )
                    ],
                  ),
                ),
              )),
              Gap(Dimesion.width15),
              InkWell(
                onTap: () {
                  // Navigate to the filter screen
                  Get.toNamed(RouteHelper.filter);
                },
                child: Container(
                  height: Dimesion.height40,
                      width: Dimesion.width20*2, // Ensure a consistent aspect ratio
                  decoration: BoxDecoration(
                    color: AppColor
                        .primaryClr, // Use primary color for the container
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                       Dimesion.radius10 ), // Match the container's radius
                    child: Image.asset(
                      'assets/img/image.png', // Replace with actual image path
                      fit: BoxFit
                          .contain, // Ensure the image fits within the container
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}