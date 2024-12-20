import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:top_star/core/app_widgets/app_button.dart';
import 'package:top_star/core/app_widgets/my_text_filed.dart';
import 'package:top_star/core/extension/text_theme_ext.dart';
import 'package:top_star/services/toast_service.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    return GetBuilder<CheckOutController>(
      builder: (builder) {
        return Obx(
          () => Scaffold(
            backgroundColor: AppColor.bgColor,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
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
                color: AppColor.white,
              ),
              padding: EdgeInsets.all(Dimesion.radius15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButtonWidget(
                    color: "0" == "0" ? Colors.black : AppColor.primaryClr,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Cash on Delivery".tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                        Gap(Dimesion.width10),
                        Image.asset('assets/icon/truck-fill.png')
                      ],
                    ),
                    onTap: () => controller.validateCodForConfirmCheckout(),
                    minWidth: Dimesion.screeWidth,
                    height: Dimesion.height40 * 1.1,
                  ),
                  SizedBox(
                    height: Dimesion.height10,
                  ),
                  AppButtonWidget(
                    color: AppColor.primaryClr,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Online Payment",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                        Gap(Dimesion.width10),
                        Image.asset('assets/icon/bank-card-fill.png')
                      ],
                    ),
                    onTap: () => controller.validatePayNowForConfirmCheckout(),
                    minWidth: Dimesion.screeWidth,
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
              toolbarHeight: Dimesion.screenHeight / 11,
              leading: backButton(),
              backgroundColor: AppColor.white,
              centerTitle: true,
              title: Text(
                "Check out",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Dimesion.font18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: Dimesion.height15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: Dimesion.width30 * 10,
                        //height: Dimesion.height30 * 13.3,
                        padding: EdgeInsets.all(Dimesion.width10),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius:
                                BorderRadius.circular(Dimesion.radius10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // padding: EdgeInsets.all(Dimesion.width10),
                          children: [
                            // SizedBox(
                            //   height: Dimesion.height10,
                            // ),
                            Text(
                              "  " + "Contact Information",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: Dimesion.font14,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.black),
                            ),
                            MyTextFieldWidget(
                              hideIcon: false,
                              controller: controller.nameController,
                              isPasswords: false,
                              hintText: "Name",
                              prefixIcon: Icons.person_outlined,
                              inputType: TextInputType.text,
                              fieldValidator: (value) {
                                if (value!.isEmpty) {
                                  ToastService.errorToast(
                                      "Please enter your name");
                                  return "";
                                } else {
                                  return null;
                                }
                              },
                              inputAction: TextInputAction.done,
                              height: Dimesion.height40,
                            ),
                            MyTextFieldWidget(
                              hideIcon: false,
                              controller: controller.phoneController,
                              isPasswords: false,
                              prefixIcon: Icons.phone,
                              hintText: "Phone Number",
                              inputType: TextInputType.text,
                              inputAction: TextInputAction.done,
                              fieldValidator: (value) {
                                if (value!.isEmpty) {
                                  ToastService.errorToast(
                                      "Please enter your phone number");
                                  return "";
                                } else if (!value.toString().isPhoneNumber) {
                                  ToastService.errorToast(
                                      "Please enter valid phone number");
                                  return "";
                                } else {
                                  return null;
                                }
                              },
                              height: Dimesion.height40,
                            ),
                            Gap(Dimesion.height10),
                            Text(
                              "  " + "Address",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: Dimesion.font14,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.black),
                            ),
                            DropDownWidget(
                                //title: "Region / State".tr,
                                hint: "",
                                regionList: controller.regionList.value,
                                onChangedRegion: (val) => {
                                      setState(() {
                                        controller.selectedRegionId.value =
                                            val!.id!;
                                        controller.selectedRegion.value =
                                            val.name.toString();
                                      })
                                    }
                                // checkOutController.onChageRegion(val!),
                                ),
                            DropDownWidget(
                                //title: "Township / City".tr,
                                hint: "",
                                townshipList: controller.townShipList,
                                onTapTownShip: () => {},
                                onChangedTownship: (val) => {
                                      setState(() {
                                        controller.selectedDeliFee.value =
                                            int.parse(val!.fee!);
                                        controller.selectedDeliveryFeeId.value =
                                            val.id!;
                                        controller.selectedTownShip.value =
                                            val.city.toString();
                                        controller.searchDeliveryData.value =
                                            val;
                                      })
                                    }
                                // checkOutController.onChangeTownShip(val!),
                                ),
                            SizedBox(
                              height: Dimesion.height10,
                            ),
                            Container(
                              height: Dimesion.height40 + 60,
                              padding: EdgeInsets.only(left: Dimesion.width10),
                              margin: EdgeInsets.symmetric(
                                  horizontal: Dimesion.width5,
                                  vertical: Dimesion.width5),
                              decoration: BoxDecoration(
                                  color: AppColor.bgColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimesion.radius15 / 2)),
                              child: TextField(
                                style: context.labelLarge,
                                controller: controller.addressController,
                                decoration: InputDecoration(
                                  labelStyle:
                                      TextStyle(fontSize: Dimesion.font16),
                                  border: InputBorder.none,
                                  helperStyle:
                                      TextStyle(fontSize: Dimesion.font16),
                                  errorStyle: const TextStyle(
                                      height: 0, color: Colors.transparent),
                                  hintText: "Address Detail" ?? "",
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: Dimesion.height10,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimesion.height20,
                    ),
                    // Container(
                    //   child: ListView.builder(
                    //       shrinkWrap: true,
                    //       physics: const NeverScrollableScrollPhysics(),
                    //       itemCount: controller.cartList.length,
                    //       itemBuilder: (_, index) {
                    //         CartModel data = controller.cartList[index];
                    //         return InkWell(
                    //           onTap: () => {
                    //             /*Get.toNamed(RouteHelper.product_detail,
                    //                   arguments: ProductDetailScreen(
                    //                     id: 1, data: null,
                    //                   ))*/
                    //           },
                    //           child: Card(
                    //             elevation: 1,
                    //             child: Container(
                    //               padding: EdgeInsets.only(
                    //                   left: Dimesion.width10,
                    //                   top: Dimesion.height5,
                    //                   right: Dimesion.width5,
                    //                   bottom: Dimesion.height5),
                    //               decoration:
                    //                   BoxDecoration(color: AppColor.white),
                    //               width: Dimesion.screeWidth,
                    //               child: Row(
                    //                 children: [
                    //                   CachedNetworkImage(
                    //                     alignment: Alignment.center,
                    //                     width: Dimesion.screeWidth / 4,
                    //                     height: Dimesion.screenHeight / 9,
                    //                     imageUrl: data.image.toString(),
                    //                     placeholder: (context, url) =>
                    //                         Container(),
                    //                     errorWidget: (context, url, error) =>
                    //                         Container(
                    //                       decoration: const BoxDecoration(
                    //                           image: DecorationImage(
                    //                               image: AssetImage(
                    //                                   "assets/img/logo.png"),
                    //                               fit: BoxFit.fill,
                    //                               filterQuality:
                    //                                   FilterQuality.high)),
                    //                     ),
                    //                     imageBuilder: (context, img) {
                    //                       return Container(
                    //                         decoration: BoxDecoration(
                    //                             borderRadius:
                    //                                 BorderRadius.circular(
                    //                                     Dimesion.radius5),
                    //                             image: DecorationImage(
                    //                               image: img,
                    //                               fit: BoxFit.cover,
                    //                               filterQuality:
                    //                                   FilterQuality.high,
                    //                               alignment:
                    //                                   FractionalOffset.center,
                    //                             )),
                    //                       );
                    //                     },
                    //                   ),
                    //                   Gap(Dimesion.width10),
                    //                   Expanded(
                    //                       child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: [
                    //                       Text(
                    //                         data.name.toString(),
                    //                         style: GoogleFonts.outfit(
                    //                             textStyle: TextStyle(
                    //                                 color: AppColor.black,
                    //                                 fontSize: Dimesion.font14,
                    //                                 fontWeight: FontWeight.bold)),
                    //                       ),
                    //                       if (data.variation.toString() != "null")
                    //                         Text(
                    //                           data.variation!.variationName
                    //                               .toString(),
                    //                           style: GoogleFonts.outfit(
                    //                               textStyle: TextStyle(
                    //                                   color: AppColor.black,
                    //                                   fontSize: Dimesion.font14,
                    //                                   fontWeight:
                    //                                       FontWeight.normal)),
                    //                         ),
                    //                       Text(
                    //                         "${DataConstant.priceFormat.format(int.parse(data.price))} MMK",
                    //                         style: GoogleFonts.outfit(
                    //                             textStyle: TextStyle(
                    //                                 color: AppColor.black,
                    //                                 fontSize: Dimesion.font14,
                    //                                 fontWeight: FontWeight.bold)),
                    //                       ),
                    //                       Text(
                    //                         "Qty : " + data.quantity.toString(),
                    //                         style: GoogleFonts.outfit(
                    //                             textStyle: TextStyle(
                    //                                 color: AppColor.black,
                    //                                 fontSize: Dimesion.font14,
                    //                                 fontWeight: FontWeight.bold)),
                    //                       )
                    //                     ],
                    //                   )),
                    //                   Gap(Dimesion.width5),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         );
                    //       }),
                    // ),
                    Container(
                      width: Dimesion.width30 * 10,
                      // height: Dimesion.height30 * 4,
                      padding: EdgeInsets.all(Dimesion.width5),
                      child: Text(
                        "Your Item(s)",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontSize: Dimesion.font14,
                                //fontWeight: FontWeight.bold,
                                color: Colors.black),
                      ),
                    ),
                    Gap(Dimesion.height5),
                    Card(
                      margin: EdgeInsets.only(
                          left: Dimesion.width10 * 2,
                          right: Dimesion.width10 * 2),
                      elevation: 2,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: Dimesion.width5,
                            top: Dimesion.height5,
                            right: Dimesion.width5,
                            bottom: Dimesion.height5),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius:
                                BorderRadius.circular(Dimesion.radius5)),
                        width: Dimesion.screeWidth,
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: AppColor.black,
                                    borderRadius: BorderRadius.circular(
                                        Dimesion.radius5)),
                                child: Image.asset(
                                  'assets/image/image 7.png',
                                  fit: BoxFit.cover,
                                )),
                            Gap(Dimesion.width10 * 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Product 1',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: Dimesion.font14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                ),
                                Text(
                                  'Size:S' + '  20,000Ks',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: Dimesion.font14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Gap(Dimesion.height10),
                    Container(
                      width: Dimesion.width30 * 10,
                      height: Dimesion.height30 * 4,
                      padding: EdgeInsets.all(Dimesion.width5),
                      decoration: BoxDecoration(
                          color: AppColor.bgColor,
                          borderRadius:
                              BorderRadius.circular(Dimesion.radius10)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sub Total".tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.grey),
                                ),
                                Text(
                                  "${DataConstant.priceFormat.format(controller.totalAmt.value)} MMK",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                            Gap(Dimesion.height5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery Fees".tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.grey),
                                ),
                                Text(
                                  "${DataConstant.priceFormat.format(controller.selectedDeliFee.value)} MMK",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                            Gap(Dimesion.height5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Cost".tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  "${DataConstant.priceFormat.format(controller.totalAmt.value + controller.selectedDeliFee.value)} MMK",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimesion.height15,
                            ),
                            // AppButtonWidget(
                            //   color: AppColor.primaryClr,
                            //   title: Text(
                            //     "Submit".tr,
                            //     style: Theme.of(context)
                            //         .textTheme
                            //         .titleMedium!
                            //         .copyWith(color: Colors.white),
                            //   ),
                            //   onTap: () {
                            //     controller.postOrder(isCod: widget.isCod);
                            //   },
                            //   minWidth: Dimesion.screeWidth,
                            //   height: Dimesion.height40 * 1.1,
                            // )
                          ]),
                      // Column(
                      //   children: [
                      //     RowTextWidget(
                      //         title: "Subtotal".tr,
                      //         val:
                      //             "${DataConstant.priceFormat.format(controller.selectedDeliFee.value ?? 0)} MMK"),
                      //     Gap(Dimesion.height10),
                      //     RowTextWidget(
                      //         title: "Delivery Fees".tr,
                      //         val:
                      //             "${DataConstant.priceFormat.format(controller.selectedDeliFee.value ?? 0)} MMK"),
                      //     Gap(Dimesion.height10),
                      //     RowTextWidget(
                      //         title: "Total Cost".tr,
                      //         val:
                      //             "${DataConstant.priceFormat.format(controller.selectedDeliFee.value ?? 0)} MMK"),
                      //   ],
                      // ),
                    ),
                    SizedBox(
                      height: Dimesion.width5,
                    ),
                    // SelectDeliveryWidget(controller: checkOutController,),
                    // Text(
                    //   "Add To Cart Items",
                    //   style: context.titleSmall,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
