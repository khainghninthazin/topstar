import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:top_star/controllers/product_controller.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/router/route_helper.dart';
import 'package:top_star/screens/nav/all_category_view.dart';


class CategoryWidget extends StatelessWidget {
  final ProductController controller;
  const CategoryWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
     final stringList=["category1","category2","category3","category4",];
    
    return Padding(
      padding:  EdgeInsets.all(20),
      child: Column(
        
        children: [
       
        SizedBox(height: Dimesion.height20,),
        Padding(
          padding:  EdgeInsets.only(left: Dimesion.width10+2,right:  Dimesion.width10+2),
          child: Column(
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      
                      crossAxisCount: 2, // Maximum width of each item
                      mainAxisExtent: 30, // Height of each item
                      mainAxisSpacing: 10, // Space between rows
                      crossAxisSpacing: 10, // Space between columns
                    ),
                    itemCount: stringList.length, // Dynamically use the length of the list
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                           Get.toNamed(RouteHelper.allcategory,
                          arguments: AllCategoryView()); 
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
        ),
      ],),
    );
  }
}