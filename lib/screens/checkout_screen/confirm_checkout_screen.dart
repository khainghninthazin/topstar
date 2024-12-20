import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:top_star/core/app_widgets/app_button.dart';
import 'package:top_star/core/app_widgets/upload_img_widget.dart';
import '../../controllers/checkout_controller.dart';
import '../../core/app_widgets/back_button.dart';
import '../../core/app_widgets/my_cache_img.dart';
import '../../core/app_widgets/my_text_filed.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/data_constant.dart';
import '../../core/constants/dimesions.dart';
import '../../services/toast_service.dart';
import 'checkout_widgets/confirm_item_widget.dart';
import 'checkout_widgets/payment_sheet.dart';

class ConfirmCheckoutScreen extends StatefulWidget {
  final bool isCod;
  const ConfirmCheckoutScreen({super.key, required this.isCod});

  @override
  State<ConfirmCheckoutScreen> createState() => _ConfirmCheckoutScreenState();
}

class _ConfirmCheckoutScreenState extends State<ConfirmCheckoutScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final CheckOutController controller = Get.find<CheckOutController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(builder: (builder) {
      return Scaffold(
        backgroundColor: AppColor.bgColor,
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
            "Online Payment".tr,
            style: TextStyle(
                color: Colors.black,
                fontSize: Dimesion.font18,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimesion.width10,
                  vertical: Dimesion.width10 * 1.5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: Dimesion.width5,
                    // ),
                    // Text(
                    //   "Name".tr,
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .titleSmall!
                    //       .copyWith(fontWeight: FontWeight.bold),
                    // ),
                    // MyTextFieldWidget(
                    //   hideIcon: true,
                    //   controller: controller.nameController,
                    //   isPasswords: false,
                    //   hintText: "Enter Your Name",
                    //   prefixIcon: Icons.person,
                    //   inputType: TextInputType.text,
                    //   fieldValidator: (value) {
                    //     if (value!.isEmpty) {
                    //       ToastService.errorToast("Please enter your name");
                    //       return "";
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    //   inputAction: TextInputAction.done,
                    //   height: Dimesion.height40,
                    // ),
                    // Text(
                    //   "Phone Number".tr,
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .titleSmall!
                    //       .copyWith(fontWeight: FontWeight.bold),
                    // ),
                    // MyTextFieldWidget(
                    //   hideIcon: true,
                    //   controller: controller.phoneController,
                    //   isPasswords: false,
                    //   prefixIcon: Icons.phone,
                    //   hintText: "Enter Your Phone Number",
                    //   inputType: TextInputType.text,
                    //   inputAction: TextInputAction.done,
                    //   fieldValidator: (value) {
                    //     if (value!.isEmpty) {
                    //       ToastService.errorToast(
                    //           "Please enter your phone number");
                    //       return "";
                    //     } else if (!value.toString().isPhoneNumber) {
                    //       ToastService.errorToast(
                    //           "Please enter valid phone number");
                    //       return "";
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    //   height: Dimesion.height40,
                    // ),
                    // Text(
                    //   "Address".tr,
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .titleSmall!
                    //       .copyWith(fontWeight: FontWeight.bold),
                    // ),
                    // Container(
                    //   height: Dimesion.height40 + 60,
                    //   padding: EdgeInsets.only(left: Dimesion.width10),
                    //   margin: EdgeInsets.symmetric(
                    //       horizontal: Dimesion.width5,
                    //       vertical: Dimesion.width5),
                    //   decoration: BoxDecoration(
                    //       color: Colors.grey[100],
                    //       borderRadius:
                    //           BorderRadius.circular(Dimesion.radius15 / 2)),
                    //   child: TextField(
                    //     style: context.labelLarge,
                    //     controller: controller.addressController,
                    //     decoration: InputDecoration(
                    //       labelStyle: TextStyle(fontSize: Dimesion.font16),
                    //       border: InputBorder.none,
                    //       helperStyle: TextStyle(fontSize: Dimesion.font16),
                    //       errorStyle: const TextStyle(
                    //           height: 0, color: Colors.transparent),
                    //       hintText: "Address..." ?? "",
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: Dimesion.width5,
                    // ),
                    Center(
                      child: Container(
                        width: Dimesion.width30 * 10,
                        //height: Dimesion.height30 * 7.5,
                        padding: EdgeInsets.all(Dimesion.width10),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius:
                                BorderRadius.circular(Dimesion.radius10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "  " + "Choose Payment",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: Dimesion.font14,
                                      //fontWeight: FontWeight.bold,
                                      color: Colors.black),
                            ),
                            Gap(Dimesion.height10),
                            Card(
                              margin: EdgeInsets.only(
                                  left: Dimesion.width5 / 2,
                                  right: Dimesion.width5 / 2),
                              color: AppColor.bgColor,
                              elevation: 2,
                              child: ListTile(
                                leading: SizedBox(
                                  width: Dimesion.width20 * 2,
                                  height: Dimesion.height20 * 2,
                                  child: Image.asset('assets/icon/kbz.png',
                                      fit: BoxFit.cover),
                                ),
                                title: Text('Kyaw Kyaw'),
                                subtitle: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      '09283991904',
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.copy))
                                  ],
                                ),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.check_box_outline_blank),
                                  color: AppColor.pink,
                                ),
                              ),
                            ),
                            Gap(Dimesion.height10),
                            Card(
                              margin: EdgeInsets.only(
                                  left: Dimesion.width5 / 2,
                                  right: Dimesion.width5 / 2),
                              color: AppColor.bgColor,
                              elevation: 2,
                              child: ListTile(
                                leading: SizedBox(
                                  width: Dimesion.width20 * 2,
                                  height: Dimesion.height20 * 2,
                                  child: Image.asset('assets/icon/aya.png',
                                      fit: BoxFit.cover),
                                ),
                                title: Text('Kyaw Kyaw'),
                                subtitle: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      '239210239411',
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.copy))
                                  ],
                                ),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.check_box_outline_blank),
                                  color: AppColor.pink,
                                ),
                              ),
                            ),
                            Gap(Dimesion.height5),
                          ],
                        ),
                      ),
                    ),
                    Gap(Dimesion.height10),
                    if (widget.isCod == false)
                      Center(
                        child: UploadImgWidget(
                          height: Dimesion.height40 + 180,
                          width: Dimesion.width30 * 10,
                          onTap: () {
                            setState(() {
                              controller.pickImage();
                            });
                          },
                          controller: controller,
                        ),
                      ),
                    SizedBox(
                      height: Dimesion.height15*5
                    ),
                    Center(
                      child: Container(
                        width: Dimesion.width30*10,
                        child: AppButtonWidget(
                          color: AppColor.primaryClr,
                          title: Text(
                            "Done".tr,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                          onTap: () {
                            controller.postOrder(isCod: widget.isCod);
                          },
                          minWidth: Dimesion.screeWidth,
                          height: Dimesion.height40 * 1.1,
                        ),
                      ),
                    )
                    // if (controller.paymentList.length != 0 &&
                    //     widget.isCod == false)
                    // Container(
                    //   width: Dimesion.screeWidth,
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //     physics: NeverScrollableScrollPhysics(),
                    //     itemCount: controller.paymentList.length,
                    //     itemBuilder: (_, index) =>
                    //         RadioListTile<PaymentData>.adaptive(
                    //       value: controller.paymentList[index],
                    //       groupValue: controller.selectedPayment.value,
                    //       onChanged: (val) {
                    //         setState(() {
                    //           if (val != null) {
                    //             controller.onSelectPayment(val);
                    //           }
                    //         });
                    //       },
                    //       title: Row(
                    //         children: [
                    //           MyCacheImg(
                    //               url: controller
                    //                       .paymentList[index].paymentLogo
                    //                       .toString() ??
                    //                   "",
                    //               boxfit: BoxFit.cover,
                    //               height: Dimesion.height40,
                    //               width: Dimesion.height40,
                    //               borderRadius: BorderRadius.circular(
                    //                   Dimesion.radius15 / 2)),
                    //           Gap(Dimesion.width5),
                    //           Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                   controller.paymentList[index].name ??
                    //                       "",
                    //                   style: Theme.of(context)
                    //                       .textTheme
                    //                       .titleMedium),
                    //               Text(
                    //                   controller.paymentList[index].number ??
                    //                       "",
                    //                   style: Theme.of(context)
                    //                       .textTheme
                    //                       .labelMedium),
                    //             ],
                    //           ),
                    //           Spacer(),
                    //           IconButton(
                    //               onPressed: () {}, icon: Icon(Icons.copy))
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey
                    //             .withOpacity(0.5), //color of shadow
                    //         spreadRadius: 5, //spread radius
                    //         blurRadius: 7, // blur radius
                    //         offset:
                    //             Offset(0, 2), // changes position of shadow
                    //         //first paramerter of offset is left-right
                    //         //second parameter is top to down
                    //       ),
                    //       //you can set more BoxShadow() here
                    //     ],
                    //     color: AppColor.white,
                    //   ),
                    //   padding: EdgeInsets.all(Dimesion.width10),
                    //   child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment:
                    //               MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               "Sub Total".tr,
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .titleMedium!
                    //                   .copyWith(color: Colors.black),
                    //             ),
                    //             Text(
                    //               "${DataConstant.priceFormat.format(controller.totalAmt.value)} MMK",
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .titleMedium!
                    //                   .copyWith(color: Colors.black),
                    //             ),
                    //           ],
                    //         ),
                    //         Row(
                    //           mainAxisAlignment:
                    //               MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               "Delivery Fees".tr,
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .titleMedium!
                    //                   .copyWith(color: Colors.black),
                    //             ),
                    //             Text(
                    //               "${DataConstant.priceFormat.format(controller.selectedDeliFee.value)} MMK",
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .titleMedium!
                    //                   .copyWith(color: Colors.black),
                    //             ),
                    //           ],
                    //         ),
                    //         Row(
                    //           mainAxisAlignment:
                    //               MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               "Grand Total".tr,
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .titleMedium!
                    //                   .copyWith(color: Colors.black),
                    //             ),
                    //             Text(
                    //               "${DataConstant.priceFormat.format(controller.totalAmt.value + controller.selectedDeliFee.value)} MMK",
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .titleMedium!
                    //                   .copyWith(color: Colors.black),
                    //             ),
                    //           ],
                    //         ),
                    //         SizedBox(
                    //           height: Dimesion.height15,
                    //         ),
                    //         AppButtonWidget(
                    //           color: AppColor.primaryClr,
                    //           title: Text(
                    //             "Submit".tr,
                    //             style: Theme.of(context)
                    //                 .textTheme
                    //                 .titleMedium!
                    //                 .copyWith(color: Colors.white),
                    //           ),
                    //           onTap: () {
                    //             controller.postOrder(isCod: widget.isCod);
                    //           },
                    //           minWidth: Dimesion.screeWidth,
                    //           height: Dimesion.height40 * 1.1,
                    //         )
                    //       ]),
                    // )
                  ]),
            ),
          ),
        ),
      );
    });
  }
}
