
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:top_star/core/app_widgets/app_button.dart';
import 'package:top_star/core/extension/text_theme_ext.dart';

import '../../../controllers/checkout_controller.dart';
import '../../../core/app_widgets/back_button.dart';
import '../../../core/app_widgets/custom_loading_widget.dart';
import '../../../core/app_widgets/row_text_widget.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/data_constant.dart';
import '../../../core/constants/dimesions.dart';
import '../../../models/cart_model.dart';
import 'drop_down_widget.dart';

class SelectDeliveryScreen extends StatefulWidget {
  const SelectDeliveryScreen({super.key});

  @override
  State<SelectDeliveryScreen> createState() => _SelectDeliveryScreenState();
}

class _SelectDeliveryScreenState extends State<SelectDeliveryScreen> {
  final CheckOutController controller = Get.find<CheckOutController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.getRegions();
      controller.getDeliveryFees();
      controller.getPayments();
    });
    /*if (checkOutController.regionList.isEmpty) {
      checkOutController.getRegions();
    }*/
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(builder: (builder){
      return Obx(()=>Scaffold(
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
          padding: EdgeInsets.all(Dimesion.radius15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButtonWidget(
                color: "0" == "0"
                    ? Colors.grey[300]
                    : AppColor.primaryClr,
                title: Text(
                  "Cash on Delivery".tr,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
                onTap: () => controller.validateCodForConfirmCheckout(),
                minWidth: Dimesion.screeWidth ,
                height: Dimesion.height40 * 1.1,
              ),
              SizedBox(
                height: Dimesion.height10,
              ),
              AppButtonWidget(
                color: AppColor.primaryClr,
                title: Text(
                  "Pay Now".tr,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                onTap: () => controller.validatePayNowForConfirmCheckout(),
                minWidth: Dimesion.screeWidth ,
                height: Dimesion.height40 * 1.1,
              ),
            ],
          ),
        ),
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
          title: Text("Cart".tr,style: TextStyle(color: Colors.white,fontSize: Dimesion.font16,fontWeight: FontWeight.bold),),
        ),
        body: ListView(padding: EdgeInsets.all(Dimesion.width10), children: [

          SizedBox(
            height: Dimesion.height10,
          ),
          DropDownWidget(
              title: "Region / State".tr,
              hint: "",
              regionList: controller.regionList.value,
              onChangedRegion: (val) =>{
                setState(() {
                  controller.selectedRegionId.value=val!.id!;
                  controller.selectedRegion.value=val.name.toString();
                })
              }
            // checkOutController.onChageRegion(val!),
          ),
          DropDownWidget(
              title: "Township / City".tr,
              hint: "",
              townshipList: controller.townShipList,
              onTapTownShip: () => {

              },
              onChangedTownship: (val) =>{
                setState(() {
                   controller.selectedDeliFee.value=int.parse(val!.fee!);
                   controller.selectedDeliveryFeeId.value=val.id!;
                   controller.selectedTownShip.value=val.city.toString();
                   controller.searchDeliveryData.value=val;
                })
              }
            // checkOutController.onChangeTownShip(val!),
          ),
          SizedBox(
            height: Dimesion.height10,
          ),
          RowTextWidget(
              title: "Delivery Fees".tr,
              val:
              "${DataConstant.priceFormat.format(controller.selectedDeliFee.value ?? 0)} MMK"),
          SizedBox(
            height: Dimesion.width5,
          ),
          // SelectDeliveryWidget(controller: checkOutController,),
          Text(
            "Add To Cart Items",
            style: context.titleSmall,
          ),
          SizedBox(
            height: Dimesion.height10,
          ),
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.cartList.length,
                itemBuilder: (_, index) {
                  CartModel data=controller.cartList[index];
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
                                    "${DataConstant.priceFormat.format(int.parse(data.price))} MMK",
                                    style: GoogleFonts.outfit(textStyle:  TextStyle(color: AppColor.black,fontSize: Dimesion.font14,fontWeight: FontWeight.bold)),
                                  ),
                                  Text(
                                    "Qty : "+data.quantity.toString(),
                                    style: GoogleFonts.outfit(textStyle:  TextStyle(color: AppColor.black,fontSize: Dimesion.font14,fontWeight: FontWeight.bold)),
                                  )
                                ],
                              )),
                              Gap(Dimesion.width5),
                            ],
                          ),
                        ),
                      ));
                }),
          ),
          SizedBox(
            height: Dimesion.height10,
          ),

        ]),
      ));
    });
  }
}
