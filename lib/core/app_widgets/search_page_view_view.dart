import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/router/route_helper.dart';
import 'package:top_star/screens/search_page.dart';

class SearchPageView extends GetView {
  const SearchPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 31, top: 50),
              child: Row(
                children: [
                 IconButton(onPressed: (){
                    Get.back();
                 }, icon: Icon(Icons.arrow_back_ios)),
                  Flexible(
                      child: InkWell(
                    onTap: () {
                      Get.toNamed(RouteHelper.search,
                          arguments: SearchPage(
                            datalist: controller.allProducts,
                          ));
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 2),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 5,
                                color: Colors.black12)
                          ],
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimesion.width10)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'Search....',
                          border: InputBorder.none,
                        ),
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
                      height: 40,
                      width: 40, // Ensure a consistent aspect ratio
                      decoration: BoxDecoration(
                        color: AppColor
                            .primaryClr, // Use primary color for the container
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            12), // Match the container's radius
                        child: Image.asset(
                          'assets/img/image.png', // Replace with actual image path
                          fit: BoxFit
                              .contain, // Ensure the image fits within the container
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}