import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_star/core/app_data.dart';
import 'package:top_star/core/app_widgets/app_button.dart';


import '../../../controllers/checkout_controller.dart';
import '../../../core/app_widgets/custom_loading_widget.dart';
import '../../../core/app_widgets/my_cache_img.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/dimesions.dart';
import '../../../router/route_helper.dart';
import '../../../services/toast_service.dart';
import '../pay_now_check_out_screen.dart';

class PaymentSheet extends StatefulWidget {
  const PaymentSheet({super.key});

  @override
  State<PaymentSheet> createState() => _PaymentSheetState();
}

class _PaymentSheetState extends State<PaymentSheet> {
  final CheckOutController checkOutController = Get.find<CheckOutController>();
  @override
  void initState() {
    //checkOutController.getPayments();
  //  checkOutController.selectedPayment.value = PaymentData();
    super.initState();
  }
  List<String> options = [
    'KBZ Pay', '34', '35',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimesion.height10),
      width: Dimesion.screeWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Select Payment Method".tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: Dimesion.height10,
          ),

          SizedBox(
            height: Dimesion.screenHeight * 0.3,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (_, index) => Obx(
                    () => RadioListTile<String>.adaptive(
                  value: "KBZ Pay",
                  groupValue: "KBZ Pay",
                  onChanged: (val) {
                    if (val != null) {
                     // checkOutController.onSelectPayment(val);
                    }
                  },
                  title: Text(
                    "KBZ Pay" ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text(
                      "0987654321" ??
                          "",
                      style: Theme.of(context).textTheme.labelSmall),
                  secondary: MyCacheImg(
                      url: AppPngs.testNetWorkPaymentImg ??
                          "",
                      boxfit: BoxFit.cover,
                      height: Dimesion.height40,
                      width: Dimesion.height40,
                      borderRadius:
                      BorderRadius.circular(Dimesion.radius15 / 2)),
                ),
              ),
            ),
          ),
          AppButtonWidget(
            color: AppColor.primaryClr,
            title: Text(
              "Check Out".tr,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
            onTap: () {
              Get.toNamed(RouteHelper.payNowCheckOutScreen,
                  arguments: PayNowCheckOutScreen(
                    /* name: checkOutController.nameController.text,
                      phone: checkOutController.phoneController.text,
                      address: checkOutController.addressController.text,
                      deliveryFee: double.parse(checkOutController
                          .searchDeliveryData.value.fees
                          .toString()),
                      *//*subTotal: double.parse(
                        checkOutController.cartController.totalAmount.value
                            .toString(),*//*
                      paymentData: checkOutController.selectedPayment.value,*/
                  ));
              /*if (checkOutController.selectedPayment.value.id != null) {
                Get.toNamed(RouteHelper.payNowCheckOutScreen,
                    arguments: PayNowCheckOutScreen(
                     *//* name: checkOutController.nameController.text,
                      phone: checkOutController.phoneController.text,
                      address: checkOutController.addressController.text,
                      deliveryFee: double.parse(checkOutController
                          .searchDeliveryData.value.fees
                          .toString()),
                      *//**//*subTotal: double.parse(
                        checkOutController.cartController.totalAmount.value
                            .toString(),*//**//*
                      paymentData: checkOutController.selectedPayment.value,*//*
                    ));
              } else {
                ToastService.errorToast("Please select payment method");
              }*/
            },
            minWidth: Dimesion.screeWidth ,
            height: Dimesion.height40 * 1.1,
            borderRadius: Dimesion.radius20,
          ),
          SizedBox(
            height: Dimesion.height30,
          )
        ],
      ),
    );
  }
}
