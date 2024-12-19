import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_star/core/app_data.dart';
import 'package:top_star/core/extension/text_theme_ext.dart';


import '../../controllers/order_his_controller.dart';
import '../../core/app_widgets/back_button.dart';
import '../../core/app_widgets/row_text_widget.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/data_constant.dart';
import '../../core/constants/dimesions.dart';
import '../../models/order_list_model.dart';
import '../../router/route_helper.dart';
import '../checkout_screen/checkout_widgets/selected_payment_widget.dart';
import '../product_detail_screen/product_detail_screen.dart';
import 'ordet_his_widgets/order_info_card_widget.dart';
import 'ordet_his_widgets/order_item_widget.dart';
import 'ordet_his_widgets/transition_image_widget.dart';


class OrderHisDetailScreen extends StatefulWidget {
  final OrderData orderData;
  final Color orderColor;
  const OrderHisDetailScreen(
      {super.key, required this.orderColor, required this.orderData});

  @override
  State<OrderHisDetailScreen> createState() => _OrderHisDetailScreenState();
}

class _OrderHisDetailScreenState extends State<OrderHisDetailScreen> {
  final OrderHisController controller = Get.find<OrderHisController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){

      controller.getOrderDetail(id: widget.orderData.id!);

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
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
        title: Text("Order History Detail".tr,style: TextStyle(color: Colors.white,fontSize: Dimesion.font16,fontWeight: FontWeight.bold),),
      ),

      body: ListView(
        padding: EdgeInsets.all(Dimesion.width10),
        children: [
          Card(
            margin: EdgeInsets.zero,
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimesion.width5)),
            color: Colors.grey.shade100,
            surfaceTintColor: Colors.grey.shade100,
            child: Container(
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
                        "ID: ${widget.orderData.customerId}",
                        style: context.titleSmall.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${DataConstant.priceFormat.format(int.parse(widget.orderData.grandTotal.toString()))} MMK",
                        style: context.titleMedium.copyWith(color: widget.orderColor),
                      ),

                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.orderData.status ?? "",
                          style: context.titleMedium.copyWith(color: widget.orderColor)),
                      Text(
                        "Date: ${DataConstant.dateFormat.format(DateTime.parse(DateTime.now().toString()))}",
                        style: context.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Dimesion.width5,
          ),
          Text(
            "Order Items".tr,
            style: context.titleSmall.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Dimesion.width5,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (_, index) {
                return InkWell(
                    onTap: () => {
                      /*Get.toNamed(RouteHelper.product_detail,
                          arguments: ProductDetailScreen(
                            id: 1, data: null,
                          ))*/
                    },
                    child: OrderItemWidget());
              }),
          SizedBox(
            height: Dimesion.width5,
          ),
          Text(
            "Payment Type".tr,
            style: context.titleSmall.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Dimesion.width5,
          ),
          SelectPaymentWidget(),
          /* orderData.payment != null
              ? SelectPaymentWidget(paymentData: orderData.payment!)
              : Text(
                  "( Cash On Delivery )",
                  style: context.labelMedium.copyWith(
                      color: AppColor.primaryClr, fontWeight: FontWeight.bold),
                ),*/
          SizedBox(
            height: Dimesion.width5,
          ),

          SizedBox(
            height: Dimesion.width5,
          ),
          OrderImageWidget(
              title: "Transition Image", imgUrl: AppPngs.testNetWorkPaymentImg),
          /*orderData.transactionImage != null
              ? OrderImageWidget(
                  title: "Transition Image", imgUrl: orderData.transactionImage)
              : const SizedBox.shrink(),*/
          /*orderData.cancellationRemark != null
              ? RemarkWidget(
                  title: "Cancellation Remark",
                  message: orderData.cancellationRemark,
                  isCancel: true)
              : const SizedBox.shrink(),
          orderData.refundRemark != null
              ? RemarkWidget(
              title: "Refund Remark",
              message: orderData.refundRemark,
              isCancel: true)
              : const SizedBox.shrink(),
          SizedBox(height: 10),
          orderData!.refundTransactionImage != null
              ? OrderImageWidget(
              title: "Refund  Image",
              imgUrl: orderData!.refundTransactionImage):Container(),
          SizedBox(height: 10),
          orderData.returnRemark != null
              ? RemarkWidget(
                  title: "Return Remark",
                  message: orderData.returnRemark,
                  isCancel: false)
              : const SizedBox.shrink(),
          orderData.returnTransactionImage != null
              ? OrderImageWidget(
                  title: "Return Transition Image",
                  imgUrl: orderData.returnTransactionImage)
              : const SizedBox.shrink(),*/
          Divider(
            color: Colors.grey[300],
          ),
          RowTextWidget(title: "Name", val: widget.orderData.name ?? ""),
          RowTextWidget(title: "Phone Number", val: widget.orderData.phone ?? ""),
          RowTextWidget(
              title: "Address",
              val:
              "${widget.orderData.address}"),
          Divider(
            color: Colors.grey[300],
          ),
          RowTextWidget(
              title: "Sub Total",
              val: "${DataConstant.priceFormat.format(int.parse(widget.orderData.subTotal.toString()))} MMK"),
          RowTextWidget(
              title: "Delivery Fees",
              val:
              "${DataConstant.priceFormat.format(int.parse(widget.orderData.deliveryFee.toString()))} MMK"),
          RowTextWidget(
              title: "Grand Total",
              val:
              "${DataConstant.priceFormat.format(int.parse(widget.orderData.grandTotal.toString()))} MMK")
        ],
      ),
    );
  }
}
