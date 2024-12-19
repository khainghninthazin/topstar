import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:top_star/controllers/auth_controller.dart';
import 'package:top_star/controllers/product_controller.dart';
import 'package:top_star/core/app_widgets/custom_loading_widget.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/screens/nav/all_product.dart';
import 'package:top_star/screens/nav/home_new_feed.dart';
import 'package:top_star/screens/nav/shop_category.dart';
import 'package:top_star/screens/nav/shop_slider.dart';
import 'package:top_star/screens/nav/toolbar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final ProductController controller=Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (value){
      return Scaffold(
        backgroundColor: AppColor.bgColor,
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
                    backgroundColor: AppColor.bgColor,
                    title: ToolbarWidget(controller: controller,)),
                CupertinoSliverRefreshControl(
                  builder: (context, refreshState, pulledExtent,
                      refreshTriggerPullDistance, refreshIndicatorExtent) {
                    return  Center(
                      child: CupertinoActivityIndicator(
                        radius: Dimesion.radius10,
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


