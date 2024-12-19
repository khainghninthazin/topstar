import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/extension/text_theme_ext.dart';


import '../../../core/constants/data_constant.dart';
import '../../../core/constants/dimesions.dart';
import '../../../models/order_list_model.dart';


class OrderInfoCardWidget extends StatelessWidget {
 final OrderData orderData;
  final Color orderColor;
  const OrderInfoCardWidget(
      {super.key, required this.orderColor, required this.orderData, });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimesion.width10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ID: ${orderData.customerId}",
                style: context.titleSmall.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "${DataConstant.priceFormat.format(int.parse(orderData.grandTotal.toString()))} Ks",
                style: context.titleMedium.copyWith(color: orderColor),
              ),

            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(orderData.status ?? "",
                  style: context.titleMedium.copyWith(color: orderColor)),
              Text(
                "Date: ${DataConstant.dateFormat.format(DateTime.parse(DateTime.now().toString()))}",
                style: context.labelMedium,
              ),
            ],
          ),
          Gap(Dimesion.width5),
          Icon(Icons.chevron_right_rounded,size: Dimesion.iconSize16,color: AppColor.primaryClr,)
        ],
      ),
    );
  }
}
