import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:top_star/controllers/new_arrival_detail_controller.dart';
import 'package:top_star/controllers/new_product_controller.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/router/route_helper.dart';
import 'package:top_star/screens/nav/product_detail_page_view.dart';

class AppCardWidget extends StatelessWidget {
  
  final int index;

  const AppCardWidget({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newpcontroller = Get.find<NewArrivalDetailController>();

    return Container(
                          padding:  EdgeInsets.only(left: Dimesion.width5),
                          // width: 170, // Set fixed width for each card
                          // margin: const EdgeInsets.symmetric(horizontal: 5),
                          // decoration: BoxDecoration(
                          //   color: Colors.grey[850],
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                             
                              child: Stack(
                                children: [
                                  Container(
                                    width: Dimesion.width30*5, // 45% of screen width
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
                                          // height: 100,
                                          margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color:newpcontroller.product[index].color,
                                              borderRadius:  BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(Dimesion.radius10),
                                                  topRight:
                                                      Radius.circular(Dimesion.radius10),
                                                  bottomLeft:
                                                      Radius.circular(Dimesion.radius10),
                                                  bottomRight:
                                                      Radius.circular(Dimesion.radius10))),
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                     BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(Dimesion.radius10),
                                                  topRight:
                                                      Radius.circular(Dimesion.radius10),
                                                ),
                                                child: Image.asset(
                                                  newpcontroller.product[index]
                                                      .imageUrl, // Replace with your image URL
                                                  height: Dimesion.height10*9,
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
                                              EdgeInsets.only(left: Dimesion.width10+3),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Product 1",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Dimesion.font14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                "Category",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: Dimesion.font14,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                "20,000 Ks",
                                                style: TextStyle(
                                                  color: Colors.pink,
                                                  fontSize: Dimesion.font14,
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
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.favorite_border,
                                        color: AppColor.primaryClr,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        );
                       
  }
}