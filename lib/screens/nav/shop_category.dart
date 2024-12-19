import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_star/controllers/product_controller.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/models/category_model.dart';
import 'package:top_star/router/route_helper.dart';

import '../../core/constants/app_color.dart';

class ShopCategoryWidget extends StatelessWidget {
  final ProductController controller;
  List catname=[
    'category1',
    'category2',
    'category3',
    'category4',
    
   
  ];
   ShopCategoryWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.categorylist.length != 0
        ? Container(
            padding:
                EdgeInsets.only(left:Dimesion.size25, right: Dimesion.size10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "categories".tr,
                      style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                              color: AppColor.black,
                              fontSize: Dimesion.font14,
                              fontWeight: FontWeight.bold)),
                    ),
                    CupertinoButton(
                        child: Text("see_all".tr,
                            style: GoogleFonts.outfit(
                                textStyle: TextStyle(
                                    color: AppColor.blackless,
                                    fontSize: Dimesion.font14,
                                    fontWeight: FontWeight.normal))),
                        onPressed: () {
                          controller.navController.tabIndex.value = 1;
                          
                        })
                  ],
                ),
                Container(
                  height: Dimesion.screenHeight / 20  ,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: catname.length,
                    itemBuilder: (context, index) {
                      CategoryData data = controller.categorylist[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(right: Dimesion.width10),
                          width: Dimesion.screeWidth / 4,
                          decoration: BoxDecoration(
                              color: AppColor.primaryClr,
                              borderRadius: BorderRadius.circular(10)),
                          height: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // CachedNetworkImage(
                              //   alignment: Alignment.center,
                              //   width: Dimesion.imageSize_one,height: Dimesion.imageSize_one,
                              //   imageUrl: data.image.toString(),
                              //   placeholder: (context, url) => Container(),
                              //   errorWidget: (context, url, error) => Container(
                              //       height: MediaQuery.of(context).size.height,
                              //       width: MediaQuery.of(context).size.width,
                              //       decoration: BoxDecoration(
                              //         color: Colors.transparent,
                              //         borderRadius: BorderRadius.circular(Dimesion.radius5-2),
                              //       ),
                              //       child: CupertinoActivityIndicator(
                              //         color: AppColor.primaryClr,
                              //         animating: true,
                              //       )),
                              //   imageBuilder: (context, img) {
                              //     return Container(
                              //       decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimesion.radius5),topRight: Radius.circular(Dimesion.radius5)),
                              //           image: DecorationImage(
                              //             image: img,
                              //             fit: BoxFit.cover,
                              //             filterQuality: FilterQuality.high,
                              //             alignment: FractionalOffset.center,
                              //           )),
                              //     );
                              //   },
                              // ),
                              Padding(padding: EdgeInsets.all(5),
                                child: Center(
                                  child: Text(
                                    catname[index],
                                    style: GoogleFonts.outfit(
                                        textStyle: TextStyle(
                                            color: AppColor.white,
                                            fontSize: Dimesion.font14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // child: Container(
                        //   width: 10,
                        //   height: 50,
                        //   decoration: BoxDecoration(
                        //     color: AppColor.primaryClr
                        //   )
                        // )
                      );
                    },
                  ),
                )
              ],
            ),
          )
        : Container());
  }
}
