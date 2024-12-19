import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:top_star/controllers/auth_controller.dart';
import 'package:top_star/controllers/checkout_controller.dart';
import 'package:top_star/core/app_widgets/app_button.dart';
import 'package:top_star/models/cart_model.dart';
import 'package:top_star/services/cart_save.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/data_constant.dart';
import '../../core/constants/dimesions.dart';
import '../../router/route_helper.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>  {
  final CheckOutController checkOutController=Get.find<CheckOutController>();
  final AuthController authController=Get.find<AuthController>();

  @override
  void initState() {
    getDataList().then((datalist){
      checkOutController.cartList.assignAll(datalist);
      checkOutController.calculate_total();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(builder: (builder){
      return Obx(()=>Scaffold(
        backgroundColor: AppColor.bgColor,
        bottomNavigationBar: Card(
          elevation: 0,
          child: Container(
            padding: EdgeInsets.only(left: Dimesion.radius5,right: Dimesion.radius5,top: Dimesion.radius5),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: Dimesion.width5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "total_quantity".tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  Text(
                    checkOutController.totalQty.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold, color: AppColor.black,fontSize: Dimesion.font16),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "total_amount".tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  Text(
                    "${DataConstant.priceFormat.format(builder.totalAmt.value)} MMK",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold, color: AppColor.black,fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: Dimesion.height20,
              ),
              AppButtonWidget(
                  onTap: () async {
                    if(authController.appToken.isNotEmpty){
                      await Get.toNamed(RouteHelper.selectDeliveryScreen);
                    }else{
                      await Get.toNamed(RouteHelper.login);
                    }
                  },
                  title: Text("check_out".tr,style: TextStyle(color: Colors.white,fontSize: Dimesion.font16),)),
              SizedBox(
                height: Dimesion.height15,
              ),
            ]),
          ),
        ),
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(Dimesion.radius15),
            ),
          ),
          toolbarHeight: Dimesion.screenHeight/11,
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.primaryClr,
          centerTitle: true,
          title: Text("cart".tr,style: TextStyle(color: Colors.white,fontSize: Dimesion.font16,fontWeight: FontWeight.bold),),
          actions: [InkWell(
            onTap: (){
              print("clear");
              setState(() {
                removeDataAll().then((value){
                  checkOutController.cartClear();
                });
              });
            },
            child: Text("Clear   ",style: TextStyle(color: Colors.white,fontSize: Dimesion.font16,fontWeight: FontWeight.bold),
          ))],
        ),
        body: Container(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: checkOutController.cartList.length,
              itemBuilder: (_, index) {
                CartModel data=checkOutController.cartList[index];
                return InkWell(
                    onTap: () => {
                      /*Get.toNamed(RouteHelper.product_detail,
                          arguments: ProductDetailScreen(
                            id: 1, data: null,
                          ))*/
                    },
                    child: Card(
                      elevation: 1,
                      child: Container(
                        padding: EdgeInsets.only(left: Dimesion.width10,top: Dimesion.height5,right: Dimesion.width5,bottom: Dimesion.height5),
                        decoration: BoxDecoration(
                            color: AppColor.white
                        ),
                        width: Dimesion.screeWidth,
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              alignment: Alignment.center,
                              width: Dimesion.screeWidth/4,height: Dimesion.screenHeight/9,
                              imageUrl: data.image.toString(),
                              placeholder: (context, url) => Container(),
                              errorWidget: (context, url, error) => Container(
                                decoration:  const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/img/logo.png"),
                                        fit: BoxFit.fill,
                                        filterQuality: FilterQuality.high)),
                              ),
                              imageBuilder: (context, img) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimesion.radius5),
                                      image: DecorationImage(
                                        image: img,
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                        alignment: FractionalOffset.center,
                                      )),
                                );
                              },
                            ),
                            Gap(Dimesion.width10),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.name.toString(),
                                  style: GoogleFonts.outfit(textStyle:  TextStyle(color: AppColor.black,fontSize: Dimesion.font14,fontWeight: FontWeight.bold)),
                                ),
                                if(data.variation.toString()!="null")
                                  Text(
                                    data.variation!.variationName.toString(),
                                    style: GoogleFonts.outfit(textStyle:  TextStyle(color: AppColor.black,fontSize: Dimesion.font14,fontWeight: FontWeight.normal)),
                                  ),
                                Text(
                                  "${DataConstant.priceFormat.format(int.parse(data.price))} Ks",
                                  style: GoogleFonts.outfit(textStyle:  TextStyle(color: AppColor.black,fontSize: Dimesion.font14,fontWeight: FontWeight.bold)),
                                )
                              ],
                            )),
                            Gap(Dimesion.width5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      CartModel cartModel=checkOutController.cartList[index];
                                      checkOutController.cartList.remove(cartModel);
                                      checkOutController.cartList.refresh();
                                      saveDataList(checkOutController.cartList);
                                      checkOutController.calculate_total();

                                    });

                                  },
                                  child: Image.asset("assets/img/delete.png",width: Dimesion.iconSize16,height: Dimesion.iconSize16,),
                                ),
                                Gap(Dimesion.height30),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          checkOutController.changeCartQuantity(isIncrease: false, product_id: data.productId!.toInt(), qty: data.quantity!.toInt());
                                        });
                                      },
                                      child: Image.asset("assets/img/remove.png",width: Dimesion.iconSize25,height: Dimesion.iconSize25,),
                                    ),
                                    Gap(Dimesion.width10),
                                    Text(data.quantity.toString(),style: TextStyle(color: Colors.black,fontSize: Dimesion.font14,fontWeight: FontWeight.bold),),
                                    Gap(Dimesion.width10),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          checkOutController.changeCartQuantity(isIncrease: true, product_id: data.productId!.toInt(), qty: data.quantity!.toInt());
                                        });
                                      },
                                      child: Image.asset("assets/img/add.png",width: Dimesion.iconSize25,height: Dimesion.iconSize25,),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ));
              }),
        ),
        /*body: Column(
          children: [
            ,
            Card(
              elevation: 1,
              child: Container(
                padding: EdgeInsets.only(left: Dimesion.width10,top: Dimesion.height5,right: Dimesion.width5,bottom: Dimesion.height5),
                decoration: BoxDecoration(
                    color: AppColor.white
                ),
                width: Dimesion.screeWidth,
                child: Row(
                  children: [
                    CachedNetworkImage(
                      alignment: Alignment.center,
                      width: Dimesion.screeWidth/4,height: Dimesion.screenHeight/9,
                      imageUrl: "https://cdn.thewirecutter.com/wp-content/media/2024/05/running-shoes-2048px-9718.jpg",
                      placeholder: (context, url) => Container(),
                      errorWidget: (context, url, error) => Container(
                        decoration:  const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/img/logo.png"),
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.high)),
                      ),
                      imageBuilder: (context, img) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimesion.radius5),
                              image: DecorationImage(
                                image: img,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                                alignment: FractionalOffset.center,
                              )),
                        );
                      },
                    ),
                    Gap(Dimesion.width10),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Testing".tr,
                          style: GoogleFonts.outfit(textStyle:  TextStyle(color: AppColor.black,fontSize: Dimesion.font14,fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          "Size : 40",
                          style: GoogleFonts.outfit(textStyle:  TextStyle(color: AppColor.black,fontSize: Dimesion.font14,fontWeight: FontWeight.normal)),
                        ),
                        Text(
                          "Color : ",
                          style: GoogleFonts.outfit(textStyle:  TextStyle(color: AppColor.black,fontSize: Dimesion.font14,fontWeight: FontWeight.normal)),
                        ),
                        Text(
                          "${DataConstant.priceFormat.format(10000)} Ks",
                          style: GoogleFonts.outfit(textStyle:  TextStyle(color: AppColor.black,fontSize: Dimesion.font14,fontWeight: FontWeight.bold)),
                        )
                      ],
                    )),
                    Gap(Dimesion.width5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Image.asset("assets/img/delete.png",width: Dimesion.iconSize16,height: Dimesion.iconSize16,),
                        ),
                        Gap(Dimesion.height10),
                        Text(
                          "Qty : 10",
                          style: GoogleFonts.outfit(textStyle:  TextStyle(color: AppColor.black,fontSize: Dimesion.font14,fontWeight: FontWeight.normal)),
                        ),
                        Text(
                          "Wholesale",
                          style: GoogleFonts.outfit(textStyle:  TextStyle(color: AppColor.blackless,fontSize: Dimesion.font14,fontWeight: FontWeight.bold)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),*/
      ));
    });
  }
}
