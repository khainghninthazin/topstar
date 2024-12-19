import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:top_star/app/product_detail_page/views/product_detail_page_view.dart';
import 'package:top_star/controllers/new_arrival_detail_controller.dart';
import 'package:top_star/controllers/new_product_controller.dart';
import 'package:top_star/core/app_widgets/back_button.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/router/route_helper.dart';
import 'package:top_star/screens/search_page.dart';

class SearchResultView extends GetView {
  const SearchResultView({super.key});
  @override
  Widget build(BuildContext context) {
    var srcontroller = Get.put(NewArrivalDetailController());
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      //  appBar: AppBar(
      //   leading: backButton(),
      //         title: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //       const SizedBox(
      //         height: 30,
      //       ),

      //       // Search Bar
      //       Padding(
      //           padding: const EdgeInsets.only(right: 20, bottom: 20),
      //           child: Row(children: [
      //             Flexible(
      //               child: InkWell(
      //                 onTap: () {
      //                   Get.toNamed(RouteHelper.searchresult,
      //                       arguments: SearchResultView());
      //                 },
      //                 child: Container(
      //                   width: MediaQuery.of(context).size.width,
      //                   padding: EdgeInsets.all(Dimesion.width5),
      //                   decoration: BoxDecoration(
      //                       boxShadow: [
      //                         BoxShadow(
      //                             offset: Offset(0, 1),
      //                             blurRadius: 5,
      //                             color: Colors.black12)
      //                       ],
      //                       color: Colors.white,
      //                       borderRadius:
      //                           BorderRadius.circular(Dimesion.width10)),
      //                   child: Row(
      //                     children: [
      //                       Icon(
      //                         CupertinoIcons.search,
      //                         size: Dimesion.iconSize25,
      //                         color: AppColor.primaryClr,
      //                       ),
      //                       Gap(Dimesion.width5),
      //                       Text(
      //                         "search".tr,
      //                         style: TextStyle(
      //                             color: Colors.grey,
      //                             fontSize: Dimesion.font16),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),

      //             Gap(Dimesion.width15),
      //           InkWell(
      //             onTap: () {
      //               // Navigate to the filter screen
      //               Get.toNamed(RouteHelper.filter);
      //             },
      //             child: Container(
      //               height: 40,
      //               width: 40, // Ensure a consistent aspect ratio
      //               decoration: BoxDecoration(
      //                 color: AppColor
      //                     .primaryClr, // Use primary color for the container
      //                 borderRadius:
      //                     BorderRadius.circular(12), // Rounded corners
      //               ),
      //               child: ClipRRect(
      //                 borderRadius: BorderRadius.circular(
      //                     12), // Match the container's radius
      //                 child: Image.asset(
      //                   'assets/img/image.png', // Replace with actual image path
      //                   fit: BoxFit
      //                       .contain, // Ensure the image fits within the container
      //                 ),
      //               ),
      //             ),
      //           ),
      //           ])),

      //     ])),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 31, top: 50),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
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
                      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 2),
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
                        decoration: const InputDecoration(
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
          ),

          Container(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Text(
                '4 Results for "products"',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 200,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(RouteHelper.productdetail,
                                arguments: ProductDetailPageView());
                          },
                          // onTap: () => Get.toNamed('/movie-detail', arguments: recontroller.popularmodel[index].id),
                          child: Container(
                            padding: EdgeInsets.only(left: 5),
                            // width: 170, // Set fixed width for each card
                            // margin: const EdgeInsets.symmetric(horizontal: 5),
                            // decoration: BoxDecoration(
                            //   color: Colors.grey[850],
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                // onTap: () {
                                //   // Navigate to the movie details page
                                //   Get.toNamed( '/movie-detail', arguments: recontroller.popularmodel[index].id);
                                // },
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 150, // 45% of screen width
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Product Image with Favorite Icon
                                          Container(
                                            height: 100,
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.blueGrey,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
                                                  ),
                                                  child: Image.asset(
                                                    srcontroller.product[index]
                                                        .imageUrl, // Replace with your image URL
                                                    height: 100,
                                                    width: double.infinity,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          // Product Details
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 13),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Product 1",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  "Category",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  "20,000 Ks",
                                                  style: TextStyle(
                                                    color: Colors.pink,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.redAccent,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )

          // Additional Content Placeholder

          //foote
        ],
      ),
    );
  }
}
