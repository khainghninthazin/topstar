import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:top_star/screens/nav/all_product.dart';
import 'package:top_star/screens/nav/shop_category.dart';
import 'package:top_star/screens/nav/toolbar.dart';


import '../../controllers/product_controller.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/dimesions.dart';
import 'shop_slider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final ProductController controller=Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (value){
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              // controller: controller.scrollController,
              slivers: [
                SliverAppBar(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(Dimesion.radius15),
                      ),
                    ),
                    toolbarHeight: Dimesion.screenHeight/6,
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColor.primaryClr,
                    title: ToolbarWidget(controller: controller,)),
                CupertinoSliverRefreshControl(
                  builder: (context, refreshState, pulledExtent,
                      refreshTriggerPullDistance, refreshIndicatorExtent) {
                    return const Center(
                      child: CupertinoActivityIndicator(
                        radius:  9,
                        color: AppColor.primaryClr,
                      ),
                    );
                  },
                  onRefresh: () async {
                    //  controller.onInit();
                    // await controller.initialFunctions();
                  },
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                      Gap(Dimesion.height10),
                      ShopSliderWidget(controller: controller,),
                      Gap(Dimesion.height10),
                      ShopCategoryWidget(controller: controller,),
                      Gap(Dimesion.height5),
                      AllProductWidget(controller: controller,)

                    ])),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: Dimesion.height10,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
