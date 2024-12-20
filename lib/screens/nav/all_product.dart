import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_star/controllers/new_product_controller.dart';
import 'package:top_star/controllers/product_controller.dart';
import 'package:top_star/router/route_helper.dart';
import 'package:top_star/screens/nav/cart.dart';
import 'package:top_star/screens/nav/new_arrival_detail_view.dart';
import 'package:top_star/screens/nav/popular_product_view.dart';
import 'package:top_star/screens/nav/product_detail_page_view.dart';
import 'package:top_star/screens/nav/productcard.dart';
import 'package:top_star/screens/product_detail_screen/product_detail_screen.dart';
import 'package:top_star/screens/search_page.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/dimesions.dart';

class AllProductWidget extends StatelessWidget {
  final ProductController controller;
  const AllProductWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var newpcontroller = Get.put(NewProductController());
    return Obx(() => Column(
          // padding:
          //     EdgeInsets.only(left: 30, right: Dimesion.size10),
          children: [
            Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding:  EdgeInsets.only(left: Dimesion.size25,right: Dimesion.size10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Arrivals".tr,
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
                          Get.toNamed(RouteHelper.newArrivalDetail,
                              arguments: NewArrivalDetailView(
                                
                              ));
                        })
                  ],
                ),
              ),
              controller.allProducts.length != 0
                  ? Container(
                      child: MasonryGridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: controller.allProducts.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: Dimesion.screenHeight / 45,
                        crossAxisSpacing: Dimesion.screeWidth / 17,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.product_detail,
                                  arguments: ProductDetailScreen(
                                      data: controller.allProducts[index]));
                            },
                            child: ProductCardWidget(
                              data: controller.allProducts[index],
                            ),
                          );
                        },
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // Horizontal scrolling
                      child: Padding(
                        padding:  EdgeInsets.only(left: Dimesion.size18),
                        child: Row(
                          children: List.generate(
                            newpcontroller.products.length,
                            (index) =>
                             Container(
                              padding: EdgeInsets.only(left:Dimesion.size10/6),
                              // width: 170, // Set fixed width for each card
                              // margin: const EdgeInsets.symmetric(horizontal: 5),
                              // decoration: BoxDecoration(
                              //   color: Colors.grey[850],
                              //   borderRadius: BorderRadius.circular(20),
                              // ),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    // Navigate to the movie details page
                                     Get.toNamed(RouteHelper.productdetail,
                              arguments: ProductDetailPage(
                                
                              ));
                                   
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: Dimesion.width30*5, // 45% of screen width
                                        margin: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(Dimesion.radius15),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
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
                                              height: Dimesion.height10*11,
                                              margin: const EdgeInsets.all(10),
                                              decoration:  BoxDecoration(
                                                  color: newpcontroller.products[index].color,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(Dimesion.radius5),
                                                          topRight:
                                                              Radius.circular(
                                                                  Dimesion.radius5),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  Dimesion.radius5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  Dimesion.radius5))),
                                              child: Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                         BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(Dimesion.radius15),
                                                      topRight:
                                                          Radius.circular(Dimesion.radius15),
                                                    ),
                                                    child: Image.asset(
                                                      newpcontroller
                                                          .products[index]
                                                          .imageUrl, // Replace with your image URL
                                                      height: Dimesion.height10*10,
                                                      width: double.infinity,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // Product Details
                                             Padding(
                                              padding: EdgeInsets.only(
                                                  left: Dimesion.size10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Product 1",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Dimesion.font14,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(height: Dimesion.size10/5),
                                                  Text(
                                                    "Category",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: Dimesion.font12,
                                                    ),
                                                  ),
                                                  SizedBox(height: Dimesion.height5),
                                                  Text(
                                                    "20,000 Ks",
                                                    style: TextStyle(
                                                      color: Colors.pink,
                                                      fontSize: Dimesion.font12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: Dimesion.size10/4),
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
                                            size: Dimesion.size18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
              PopularProductView()
            ]),
          ],
        ));
  }
}