import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_star/controllers/new_product_controller.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/router/route_helper.dart';
import 'package:top_star/screens/nav/all_popular_product_view.dart';
import 'package:top_star/screens/nav/product_detail_page_view.dart';
import 'package:top_star/screens/search_page.dart';

class PopularProductView extends GetView {
  const PopularProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var popcontroller = Get.put(NewProductController()); // GetX controller

    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(left: Dimesion.size25, right: Dimesion.size10 / 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Row with title and see all button
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular product".tr,
                    style: GoogleFonts.outfit(
                      textStyle: TextStyle(
                        color: AppColor.black,
                        fontSize: Dimesion.font14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CupertinoButton(
                      child: Text(
                        "see_all".tr,
                        style: GoogleFonts.outfit(
                          textStyle: TextStyle(
                            color: AppColor.blackless,
                            fontSize: Dimesion.font14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(RouteHelper.allpopularproduct,
                            arguments: AllPopularProductView());
                      })
                ],
              ),
            ),

            // Padding and List of Popular Products
            Padding(
              padding: EdgeInsets.symmetric(vertical: Dimesion.height10),
              child: Padding(
                padding: EdgeInsets.only(right: Dimesion.width15),
                child: Column(
                  children: List.generate(
                    popcontroller.products.length,
                    (index) {
                      var product = popcontroller.products[index];

                      return Padding(
                        padding: EdgeInsets.only(bottom: Dimesion.height10),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity, // Use full width
                              // height: 100, // Card height
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Image Section
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          popcontroller.products[index].color,
                                    ),

                                    width: Dimesion.width10 * 9,
                                    height:
                                        Dimesion.width10 * 9, // Height of image
                                    margin: EdgeInsets.all(10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          Dimesion.radius20),
                                      child: Image.asset(
                                        popcontroller.products[index]
                                            .imageUrl, // Dynamic image URL
                                        width: Dimesion.width15 / 2,
                                        height: Dimesion.height15 / 2,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      width:
                                          10), // Space between image and text section
                                  // Product Details and Action Section
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Product Title
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: Dimesion.height5-3,
                                            ),
                                            child: Text(
                                              popcontroller.products[index]
                                                  .name, // Dynamic product title
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          // Product Description
                                          Text(
                                            popcontroller.products[index].price
                                                .toString(), // Dynamic product description
                                            style: TextStyle(
                                              fontSize: Dimesion.font14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(height: Dimesion.height10,),
                                          // Price and View Details Button
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '\$${product.price}', // Dynamic price
                                                style: TextStyle(
                                                  fontSize: Dimesion.font14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                ),
                                              ),
                                             
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),


                            Positioned(
                              top: 5,
                              right: 5,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.7),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(2, 1),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.redAccent,
                                  size: 20,
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: 0,
                              right: 0,
                              child:  Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: AppColor.primaryClr,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        Dimesion.radius10),
                                                    bottomRight:
                                                        Radius.circular(
                                                            Dimesion.radius10),
                                                  ),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        RouteHelper
                                                            .productdetail,
                                                        arguments:
                                                            ProductDetailPage());
                                                  },
                                                  child: const Text(
                                                    "View Details",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ),)
                          ],
                        ),
                      );
                    },
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
