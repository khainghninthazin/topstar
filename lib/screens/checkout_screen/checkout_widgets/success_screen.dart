import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:top_star/core/app_widgets/app_button.dart';

import '../../../core/app_widgets/row_text_widget.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/data_constant.dart';
import '../../../core/constants/dimesions.dart';
import '../../../router/route_helper.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key,});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimesion.width10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              "assets/lottie/thank.json",
              height: Dimesion.screenHeight * 0.4,
              fit: BoxFit.contain,
            ),
            Text("Thank you for your order ${1}!",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColor.primaryClr)),
            SizedBox(
              height: Dimesion.height10,
            ),

            SizedBox(
              height: Dimesion.height10,
            ),
            RowTextWidget(
                title: "Order Type",
                val: "0"== "1"
                    ? "Cash on Delivery"
                    : "Online Payment"),
            SizedBox(
              height: Dimesion.width5,
            ),
            RowTextWidget(
                title: "Sub Total",
                val:
                    "${DataConstant.priceFormat.format(1000)} MMK"),
            SizedBox(
              height: Dimesion.width5,
            ),
            RowTextWidget(
                title: "Delivery Fees",
                val:
                    "${DataConstant.priceFormat.format(1000)} MMK"),
            SizedBox(
              height: Dimesion.width5,
            ),
            RowTextWidget(
                title: "Grand Total",
                val:
                    "${DataConstant.priceFormat.format(2000)} MMK"),
            SizedBox(
              height: Dimesion.height20,
            ),
            AppButtonWidget(
              color: AppColor.primaryClr,
              title: Text(
                "Go to Home".tr,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
              ),
              onTap: () async {
                /*notiController.getNotiList();
                CheckOutController checkOutController =
                    Get.find<CheckOutController>();
                checkOutController.resetCheckoutSelection();*/
                await Get.offNamed(RouteHelper.nav);
              },
              minWidth: Dimesion.screeWidth ,
              height: Dimesion.height40 * 1.1,
            ),
          ],
        ),
      ),
    );
  }
}
