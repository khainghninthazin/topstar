import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_star/controllers/new_arrival_detail_controller.dart';
import 'package:top_star/core/app_widgets/back_button.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/router/route_helper.dart';
import 'package:top_star/screens/nav/product_detail_page_view.dart';
import 'package:top_star/screens/search_page.dart';

class AllPopularProductView extends GetView {
  const AllPopularProductView({super.key});
  @override
  Widget build(BuildContext context) {
    var allproductcontroller = Get.put(NewArrivalDetailController());
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        leading: backButton(),
        backgroundColor: AppColor.white,
        title:  Text(
          'Popular products',
          style: TextStyle(color: Colors.black,fontSize: Dimesion.font18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             SizedBox(
              height: Dimesion.height30,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimesion.width20 + 4, right: Dimesion.width20),
              child: Row(
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
                      height: Dimesion.height40,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          top: Dimesion.height10,
                          bottom: Dimesion.height10,
                          left: Dimesion.width5),
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
                          hintStyle: TextStyle(color: Colors.grey,fontSize: Dimesion.font14),
                          prefixIcon: Icon(
                            Icons.search,size: Dimesion.size24,
                            
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
                     height: Dimesion.height40,
                    width:  Dimesion.width20*2, // Ensure a consistent aspect ratio
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
            SingleChildScrollView(
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
                    allproductcontroller.product.length,
                    (index) {
                      var product =allproductcontroller.product[index];

                      return Padding(
                        padding: EdgeInsets.only(bottom: Dimesion.height10),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity, // Use full width
                              height: Dimesion.height10*9, // Card height
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
                                      borderRadius: BorderRadius.circular(Dimesion.radius10),
                                      color:
                                          allproductcontroller.product[index].color,
                                    ),

                                    width: Dimesion.width10 * 9,
                                    height:
                                        Dimesion.width10 * 9, // Height of image
                                    margin: EdgeInsets.all(10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          Dimesion.radius20),
                                      child: Image.asset(
                                        allproductcontroller.product[index]
                                            .imageUrl, // Dynamic image URL
                                        width: Dimesion.width15 / 2,
                                        height: Dimesion.height15 / 2,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  
                                   SizedBox(
                                      width:Dimesion.width10
                                          ),
                                          
                                          
                                          
                                           
                                  // Product Details and Action Section
                                  Expanded(
                                    child: Padding(
                                      padding:  EdgeInsets.only(
                                          top: Dimesion.height10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Product Title
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: Dimesion.height5 - 3,
                                            ),
                                            child: Text(
                                              allproductcontroller.product[index]
                                                  .name, // Dynamic product title
                                              style:  TextStyle(
                                                fontSize: Dimesion.font16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                           SizedBox(
                                            height: Dimesion.height5,
                                          ),
                                          // Product Description
                                          Text(
                                           allproductcontroller.product[index].price
                                                .toString(), // Dynamic product description
                                            style: TextStyle(
                                              fontSize: Dimesion.font12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          SizedBox(
                                            height: Dimesion.height10,
                                          ),
                                          // Price and View Details Button
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '\$${product.price}', // Dynamic price
                                                style: TextStyle(
                                                  fontSize: Dimesion.font12,
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
                                child:const Icon(
                                  Icons.favorite_border,
                                  color: Colors.redAccent,
                                  size: 20,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColor.primaryClr,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(Dimesion.radius10),
                                    bottomRight:
                                        Radius.circular(Dimesion.radius10),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(RouteHelper.productdetail,
                                        arguments: ProductDetailPage());
                                  },
                                  child:  Text(
                                    "View Details",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimesion.font12,
                                    ),
                                  ),
                                ),
                              ),
                            )
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
    )
    ])));
  }
}