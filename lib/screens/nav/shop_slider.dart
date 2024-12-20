import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_star/controllers/product_controller.dart';
import 'package:top_star/core/app_widgets/my_cache_img.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';

class ShopSliderWidget extends StatelessWidget {
  final ProductController controller;

  ShopSliderWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var currentImage = 0.obs; // Define here
    return Obx(() => controller.bannerList.isNotEmpty
        ? Column(
            children: [
              SizedBox(
                height: Dimesion.screenHeight / 5,
                width: Dimesion.width30*9,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlay: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      currentImage.value = index; // Update the active image
                    },
                  ),
                  items: controller.bannerList
                      .map((item) => Container(
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(
                                    Dimesion.width10)),
                            child: MyCacheImg(
                              url: item.image.toString(),
                              boxfit: BoxFit.fill,
                              borderRadius: BorderRadius.circular(
                                  Dimesion.radius5),
                            ),
                          ))
                      .toList(),
                ),
              ),
               SizedBox(height:Dimesion.height10 ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.bannerList.length,
                      (index) => buildDot(index, currentImage.value),
                    ),
                  )),
            ],
          )
        : Container());
  }

  Widget buildDot(int index, int currentPage) {
    return Container(
      height: Dimesion.height5,
      width: currentPage == index ? 25 : 6,
      margin: const EdgeInsets.only(right: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimesion.radius5),
        color: AppColor.primaryClr,
      ),
    );
  }
}