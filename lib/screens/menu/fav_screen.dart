import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:top_star/controllers/product_controller.dart';


import '../../controllers/fav_controller.dart';
import '../../core/app_widgets/back_button.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/dimesions.dart';
import '../../router/route_helper.dart';
import '../nav/productcard.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  final FavController favController = Get.find<FavController>();
  final ProductController productController = Get.find<ProductController>();

  @override
  void initState() {
   // favController.getFavList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(Dimesion.radius15),
          ),
        ),
        toolbarHeight: Dimesion.screenHeight/11,
        leading: backButton(),
        backgroundColor: AppColor.primaryClr,
        centerTitle: true,
        title: Text("Whitelist".tr,style: TextStyle(color: Colors.white,fontSize: Dimesion.font16,fontWeight: FontWeight.bold),),
      ),

      body: productController.allProducts.length!=0?
      Container(
        margin: EdgeInsets.only(bottom: Dimesion.height10),
        padding: EdgeInsets.only(left: Dimesion.size10,right: Dimesion.size10,top: Dimesion.height10),
        child: MasonryGridView.count(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: productController.allProducts.length,
          crossAxisCount: 2,
          mainAxisSpacing: Dimesion.screenHeight/45,
          crossAxisSpacing: Dimesion.screeWidth/17,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Get.toNamed(RouteHelper.product_detail);
              },
              child: ProductCardWidget(data: productController.allProducts[index],),
            );
          },
        ),
      ):Container(),
    );
  }
}