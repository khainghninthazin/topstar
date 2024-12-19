import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:top_star/core/app_widgets/app_button.dart';
import 'package:top_star/router/route_helper.dart';
import 'package:top_star/screens/nav/filter_search_view.dart';

import '../core/app_widgets/back_button.dart';
import '../core/constants/app_color.dart';
import '../core/constants/dimesions.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final stringList = [
    "category1",
    "category2",
    "category3",
    "category4",
    "category5",
    "category6"
  ];
  final brandlist = ["brand1", "brand2", "brand3", "brand4", "brand5"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        toolbarHeight: Dimesion.screenHeight / 11,
        leading: backButtonBlack(),
        centerTitle: true,
        title: Text(
          "filter".tr,
          style: TextStyle(
              color: Colors.black,
              fontSize: Dimesion.font16,
              fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 27, right: 23, bottom: 18),
        child: InkWell(
          onTap: () {
            Get.toNamed(RouteHelper.fitsearch, arguments: FilterSearchView());
          },
          child: Row(
            children: [
              // Flexible(child: AppButtonWidget(title: Text("reset_filter".tr,style: TextStyle(color: AppColor.red,fontSize: Dimesion.font14),),color: Colors.grey[100],)),
              // Gap(Dimesion.width10),
              Flexible(
                  child: AppButtonWidget(
                title: Text(
                  "search".tr,
                  style: TextStyle(
                      color: AppColor.white, fontSize: Dimesion.font14),
                ),
                color: AppColor.primaryClr,
              ))
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.bgColor,

      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimesion.width10),
        child: Padding(
          padding:  EdgeInsets.only(right: Dimesion.width30, left: Dimesion.width30),
          child: InkWell(
            onTap: () {
              Get.toNamed(RouteHelper.fitsearch, arguments: FilterSearchView());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "category".tr,
                  style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                          color: AppColor.black,
                          fontSize: Dimesion.font14,
                          fontWeight: FontWeight.bold)),
                ),
                Gap(Dimesion.height20),
                Column(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 120, // Maximum width of each item
                        mainAxisExtent: 30, // Height of each item
                        mainAxisSpacing: 10, // Space between rows
                        crossAxisSpacing: 10, // Space between columns
                      ),
                      itemCount: stringList
                          .length, // Dynamically use the length of the list
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Add your onTap functionality here
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColor.primaryClr,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                stringList[index],
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: Dimesion.font16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(Dimesion.height20),
                Text(
                  "brand".tr,
                  style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                          color: AppColor.black,
                          fontSize: Dimesion.font14,
                          fontWeight: FontWeight.bold)),
                ),
                Gap(Dimesion.height20),
                Column(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // Maximum width of each item
                        mainAxisExtent: 30, // Height of each item
                        mainAxisSpacing: 10, // Space between rows
                        crossAxisSpacing: 10, // Space between columns
                      ),
                      itemCount: brandlist
                          .length, // Dynamically use the length of the list
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Add your onTap functionality here
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 2, top: 2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColor.primaryClr,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              brandlist[index],
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: Dimesion.font16,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Gap(Dimesion.height30),
                Row(
                  children: [
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Lowest Price".tr,
                          style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                  color: AppColor.black,
                                  fontSize: Dimesion.font14,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Gap(Dimesion.height20),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey[00],
                              borderRadius:
                                  BorderRadius.circular(Dimesion.radius5)),
                          margin: EdgeInsets.only(right: Dimesion.width20),
                          width: Dimesion.screeWidth,
                          height: Dimesion.height40,
                          child: Text(
                            "0 MMK",
                            style: TextStyle(
                                color: AppColor.blackless,
                                fontSize: Dimesion.font16),
                          ),
                        )
                      ],
                    )),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.end,
                          "to".tr,
                          style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                  color: AppColor.black,
                                  fontSize: Dimesion.font14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Gap(Dimesion.width20),
                    Flexible(
                        child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Heighest Price".tr,
                          style: GoogleFonts.outfit(
                              textStyle: TextStyle(
                                  color: AppColor.black,
                                  fontSize: Dimesion.font14,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Gap(Dimesion.height20),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius:
                                  BorderRadius.circular(Dimesion.radius5)),
                          width: Dimesion.screeWidth,
                          height: Dimesion.height40,
                          child: Text(
                            "0 MMK",
                            style: TextStyle(
                                color: AppColor.blackless,
                                fontSize: Dimesion.font16),
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
