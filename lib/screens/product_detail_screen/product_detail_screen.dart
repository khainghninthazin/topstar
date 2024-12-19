import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:top_star/controllers/checkout_controller.dart';
import 'package:top_star/core/app_widgets/back_button.dart';
import 'package:top_star/models/cart_model.dart';
import 'package:top_star/models/product_model.dart';
import 'package:top_star/router/route_helper.dart';
import 'package:top_star/screens/nav/nav_controller.dart';
import 'package:top_star/screens/product_detail_screen/product_detail_body.dart';
import 'package:top_star/screens/product_detail_screen/widgets/image_slider_widget.dart';
import 'package:top_star/services/cart_save.dart';

import '../../controllers/product_controller.dart';
import '../../core/app_widgets/my_cache_img.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/dimesions.dart';

class ProductDetailScreen extends StatefulWidget {
  final int? id;
  final ProductData data;
  const ProductDetailScreen({
    super.key,
    this.id, required this.data,
  });
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final CheckOutController checkOutController=Get.find<CheckOutController>();
  final NavController navController=Get.find<NavController>();

  int code_index = 0;
  final shakeKey = GlobalKey<ShakeWidgetState>();

  final controller=Get.find<ProductController>();
  String selectedValue = "";
  String selectedValue2 = "";

  bool isWholeSale = false;
  bool isCheck = false;
  int totalWholeSale = 0;
  int actucalWholeSaleQuantity = 0;

  List<String> images=[];


  List<Variations> varientList=[];


  @override
  void initState() {
    varientList.clear();

    WidgetsBinding.instance.addPostFrameCallback((_){
      checkOutController.qty.value=1;

      if(checkOutController.cartList.length!=0){
        for (var map in checkOutController.cartList) {
          if (map.productId == widget.data.id) {
            checkOutController.qty.value= map.quantity!.toInt();
          }
        }
      }
    });
    images.add(widget.data.image.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(builder: (builder){
      return Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: AppBar(
          toolbarHeight: Dimesion.height40+27,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(Dimesion.radius15),
            ),
          ),
          backgroundColor: AppColor.white,
          centerTitle: false,
          title: Text(
            "Product Detail".tr,
            style: TextStyle(fontSize: Dimesion.font18,color: AppColor.black),
          ),
          leading: backButtonBlack(),
          elevation: 0,
          scrolledUnderElevation: 0,
          actions: [
            ShakeMe(
              // 4. pass the GlobalKey as an argument
              key: shakeKey,
              // 5. configure the animation parameters
              shakeCount: 3,
              shakeOffset: 10,
              shakeDuration: Duration(milliseconds: 500),
              // 6. Add the child widget that will be animated
              child: Obx(()=>InkWell(
                onTap: (){
                  navController.tabIndex.value=3;
                  Get.toNamed(RouteHelper.nav);
                },
                child: Badge(
                  padding: EdgeInsets.all(2),
                  alignment: Alignment.topRight,
                  label: Text(checkOutController.cartList.length.toString(),
                    //  cont.unReadNotiList.length.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                  backgroundColor: Colors.redAccent,
                  child: Container(
                    width: Dimesion.height40,
                    height: Dimesion.height40,
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(Dimesion.size10)
                    ),
                    child: Padding(padding: EdgeInsets.all(Dimesion.radius10),child: Icon(CupertinoIcons.cart),),
                  ),
                ),
              )),
            ),
            Gap(Dimesion.width20)
            /*IconButton(
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
              onPressed: () {
                if (controller.authController.appToken.isEmpty) {
                  DialogService.showDialog(
                      isDelete: false,
                      message: "You need to login first.\nWanna login?",
                      dialogType: DialogType.error,
                      context: context);
                } else {
                  *//*if (controller.isFavorite.value == true) {
                    controller.removeFav(productId: widget.id ?? 0);
                  } else {
                    controller.addFav(productId: widget.id ?? 0);
                  }*//*
                }
              },
              icon: Icon(
                controller.isFavorite.value
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: AppColor.primaryClr,
                size: Dimesion.iconSize16 * 1.3,
              )),*/
          ],
        ),
        body: GetBuilder<ProductController>(
            builder: (controller) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: Dimesion.screenHeight * 0.41,
                    flexibleSpace: FlexibleSpaceBar(
                      background: ImageSlider(
                        carouselController: controller.carouselController,
                        images: images,
                        /*images:
                            controller.productDetail.value.product == null
                                ? []
                                : controller.productDetail.value.product!
                                .getImageList(),*/
                        // activeIndex: controller.imgIndex.value,
                        onPageChanged: (val, _) {
                          //controller.imgIndex.value = val;
                        }, activeIndex: 0,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    scrolledUnderElevation: 0,
                    pinned: true,
                    bottom: PreferredSize(
                      preferredSize:
                      Size.fromHeight(Dimesion.screenHeight * 0.04),
                      child: Container(
                        padding: EdgeInsets.all(Dimesion.height10 / 2),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimesion.radius15),
                                topRight:
                                Radius.circular(Dimesion.radius15))),
                        child: SizedBox(
                          height: Dimesion.height40 * 1.1,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: List.generate(4,
                                /*controller.productDetail.value.product ==
                                        null
                                        ? 0
                                        : controller.productDetail.value
                                        .product!.images!.length,*/
                                    (index) => InkWell(
                                  onTap: () {
                                    /* controller.carouselController
                                            .animateToPage(index);*/
                                  },
                                  child: Container(
                                    padding:
                                    EdgeInsets.all(Dimesion.width5),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: Dimesion.width5),
                                    decoration: BoxDecoration(
                                        border: index ==
                                            widget.data.image
                                            ? Border.all(
                                            color:
                                            AppColor.primaryClr,
                                            width: 2)
                                            : null,
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    child: MyCacheImg(
                                        url: widget.data.image.toString(),
                                        height: Dimesion.height40,
                                        width: Dimesion.height40,
                                        boxfit: BoxFit.contain,
                                        borderRadius:
                                        BorderRadius.circular(
                                            Dimesion.radius15 / 2)),
                                  ),
                                )),

                          ),
                        ),
                      ),
                    ),
                  ),

                  SliverList(
                      delegate: SliverChildListDelegate([
                        ProductDetailBodyView(data: widget.data,)

                      ])),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: Dimesion.height10,
                    ),
                  )
                ],
              );
            }),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow:[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 5, //spread radius
                blurRadius: 7, // blur radius
                offset: Offset(0, 2), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              ),
              //you can set more BoxShadow() here
            ],
            color: AppColor.white,),
          padding: EdgeInsets.only(
              bottom: Dimesion.height15,
              top: Dimesion.height15,
              left: Dimesion.height10,
              right: Dimesion.height10),
          child: Obx(()=>Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Gap(Dimesion.width5),
            Container(
              height: Dimesion.height40 * 1.1,
              padding: EdgeInsets.all(Dimesion.width5 / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimesion.radius10)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () =>{
                        setState(() {
                          checkOutController.changeQuantity(isIncrease: false, product_id: widget.data.id!);
                        })
                      },
                      icon: const Icon(Icons.remove,color: AppColor.red,)),
                  Text(
                    checkOutController.qty.value.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  IconButton(
                      onPressed: () =>{
                        setState(() {
                          checkOutController.changeQuantity(isIncrease: true, product_id: widget.data.id!);
                        })
                      },
                      icon: const Icon(Icons.add,color: AppColor.red,)),
                ],
              ),
            ),
            SizedBox(
              width: Dimesion.width10,
            ),
            InkWell(
              onTap: (){
                setState(() {
                  CartModel model=new CartModel();
                  if(widget.data.variations!.length!=0){
                    model=CartModel(productId: widget.data.id,productVarientId: widget.data.variations![0].id, quantity: checkOutController.qty.value, variation: widget.data.variations![0], price: widget.data.variations![0].price, image: widget.data.image, totalPrice: int.parse(widget.data.variations![0].price.toString())*checkOutController.qty.value, name: widget.data.name,);
                  }else{
                    model=CartModel(productId: widget.data.id,productVarientId: null, quantity: checkOutController.qty.value, variation: null, price: widget.data.price, image: widget.data.image, totalPrice: int.parse(widget.data.price)*checkOutController.qty.value, name: widget.data.name,);
                  }
                  getDataList().then((value){
                    if(value.length>1 && value.length!=0){
                      for (var map in value) {
                        if (map.productId == model.productId) {
                          map.quantity=map.quantity! + model.quantity!;
                          map.totalPrice=int.parse(map.totalPrice.toString()) + int.parse(model.totalPrice.toString());
                        }
                      }
                    }else{
                      value.add(model);
                    }

                    saveDataList(value).then((data){
                      getDataList().then((cartList){
                        checkOutController.cartList.assignAll(cartList);
                        checkOutController.totalQty.value=0;
                        checkOutController.totalAmt.value=0;
                        for (var i = 0; i < checkOutController.cartList.length; i++) {
                          checkOutController.totalQty.value+=cartList![i].quantity!;
                          checkOutController.totalAmt.value+=int.parse(cartList![i].totalPrice.toString())!;
                        }
                      });
                    });
                  });
                });
                shakeKey.currentState!.shake();
              },
              child: Container(
                padding: EdgeInsets.only(left: Dimesion.width30,right: Dimesion.width30,top: Dimesion.height5+4,bottom: Dimesion.height5+4),
                decoration: BoxDecoration(
                    color: AppColor.primaryClr,
                    borderRadius: BorderRadius.circular(Dimesion.radius15 / 2)),
                child: Row(
                  children: [
                    Image.asset("assets/img/shopping.png",width: Dimesion.iconSize25,height: Dimesion.iconSize25,),
                    Gap(Dimesion.width10),
                    Text(
                      "Add to Cart".tr.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold,color: AppColor.white,),
                    )
                  ],
                ),
              ),
            ),
          ])),
        ),
      );
    });
  }
}
