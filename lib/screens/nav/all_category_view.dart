import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:top_star/controllers/new_arrival_detail_controller.dart';
import 'package:top_star/core/app_widgets/app_card_widget.dart';
import 'package:top_star/core/app_widgets/back_button.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/router/route_helper.dart';
import 'package:top_star/screens/nav/product_detail_page_view.dart';
import 'package:top_star/screens/search_page.dart';

class AllCategoryView extends GetView {
  const AllCategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    var allcatcontroller=Get.put(NewArrivalDetailController());
   return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        leading: backButton(),
        backgroundColor: Colors.white,
        title: Text(
          'Category 1',
          style: TextStyle(color: Colors.black, fontSize: Dimesion.font18 + 2),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Dimesion.height20 + 5,
          ),

          // Search Bar
          Padding(
            padding: EdgeInsets.only(
                left: Dimesion.width30, right: Dimesion.width30),
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
                    width: Dimesion.width20 *
                        2, // Ensure a consistent aspect ratio
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

          const SizedBox(
            height: 5,
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(Dimesion.size18 + 2),
                child: Column(
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: Dimesion.height40*5,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5),
                      itemCount: allcatcontroller.product.length,
                      itemBuilder: (context, index) {
                        // return Container(
                        //       padding: EdgeInsets.only(left:Dimesion.size10/6),
                        //       // width: 170, // Set fixed width for each card
                        //       // margin: const EdgeInsets.symmetric(horizontal: 5),
                        //       // decoration: BoxDecoration(
                        //       //   color: Colors.grey[850],
                        //       //   borderRadius: BorderRadius.circular(20),
                        //       // ),
                        //       child: InkWell(
                        //           borderRadius: BorderRadius.circular(20),
                        //           onTap: () {
                        //             // Navigate to the movie details page
                        //              Get.toNamed(RouteHelper.productdetail,
                        //       arguments: ProductDetailPage(
                                
                        //       ));
                                   
                        //           },
                        //           child: Stack(
                        //             children: [
                        //               Container(
                        //                 width: Dimesion.width30*5, // 45% of screen width
                        //                 margin: const EdgeInsets.all(4),
                        //                 decoration: BoxDecoration(
                        //                   color: Colors.white,
                        //                   borderRadius:
                        //                       BorderRadius.circular(Dimesion.radius15),
                        //                   boxShadow: [
                        //                     BoxShadow(
                        //                       color:
                        //                           Colors.grey.withOpacity(0.2),
                        //                       spreadRadius: 1,
                        //                       blurRadius: 5,
                        //                       offset: const Offset(0, 2),
                        //                     ),
                        //                   ],
                        //                 ),
                        //                 child: Column(
                        //                   crossAxisAlignment:
                        //                       CrossAxisAlignment.start,
                        //                   children: [
                        //                     // Product Image with Favorite Icon
                        //                     Container(
                        //                       height: Dimesion.height10*11,
                        //                       margin: const EdgeInsets.all(10),
                        //                       decoration:  BoxDecoration(
                        //                           color: allcatcontroller.product[index].color,
                        //                           borderRadius:
                        //                               BorderRadius.only(
                        //                                   topLeft: Radius
                        //                                       .circular(Dimesion.radius5),
                        //                                   topRight:
                        //                                       Radius.circular(
                        //                                           Dimesion.radius5),
                        //                                   bottomLeft:
                        //                                       Radius.circular(
                        //                                           Dimesion.radius5),
                        //                                   bottomRight:
                        //                                       Radius.circular(
                        //                                           Dimesion.radius5))),
                        //                       child: Column(
                        //                         children: [
                        //                           ClipRRect(
                        //                             borderRadius:
                        //                                  BorderRadius.only(
                        //                               topLeft:
                        //                                   Radius.circular(Dimesion.radius15),
                        //                               topRight:
                        //                                   Radius.circular(Dimesion.radius15),
                        //                             ),
                        //                             child: Image.asset(
                        //                               allcatcontroller
                        //                                   .product[index]
                        //                                   .imageUrl, // Replace with your image URL
                        //                               height: Dimesion.height10*10,
                        //                               width: double.infinity,
                        //                               fit: BoxFit.contain,
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),

                        //                     // Product Details
                        //                      Padding(
                        //                       padding: EdgeInsets.only(
                        //                           left: Dimesion.size10),
                        //                       child: Column(
                        //                         crossAxisAlignment:
                        //                             CrossAxisAlignment.start,
                        //                         children: [
                        //                           Text(
                        //                             "Product 1",
                        //                             style: TextStyle(
                        //                               fontWeight:
                        //                                   FontWeight.bold,
                        //                               fontSize: Dimesion.font14,
                        //                               color: Colors.black,
                        //                             ),
                        //                           ),
                        //                           SizedBox(height: Dimesion.size10/5),
                        //                           Text(
                        //                             "Category",
                        //                             style: TextStyle(
                        //                               color: Colors.grey,
                        //                               fontSize: Dimesion.font12,
                        //                             ),
                        //                           ),
                        //                           SizedBox(height: Dimesion.height5),
                        //                           Text(
                        //                             "20,000 Ks",
                        //                             style: TextStyle(
                        //                               color: Colors.pink,
                        //                               fontSize: Dimesion.font12,
                        //                               fontWeight:
                        //                                   FontWeight.bold,
                        //                             ),
                        //                           ),
                        //                           SizedBox(height: Dimesion.size10/4),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //               Positioned(
                        //                 top: 10,
                        //                 right: 10,
                        //                 child: Container(
                        //                   padding: EdgeInsets.all(5),
                        //                   decoration: BoxDecoration(
                        //                     color: Colors.white,
                        //                     shape: BoxShape.circle,
                        //                   ),
                        //                   child: Icon(
                        //                     Icons.favorite_border,
                        //                     color: Colors.redAccent,
                        //                     size: Dimesion.size18,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           )),
                        //     );

                        return AppCardWidget(index: index);
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