import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_star/models/order_detail_model.dart';


import '../models/order_list_model.dart';
import '../services/toast_service.dart';
import '../repository/order_his_repo.dart';

class OrderHisController extends GetxController {
  final OrderHisRepo orderHisRepo;
  OrderHisController({required this.orderHisRepo});
  @override
  void onInit() {
   // getOrderHis();
    super.onInit();
  }

  Rx<OrderDetailData> orderDetailData=OrderDetailData().obs;
  RxBool isLoading = false.obs;
  RxList<OrderData> orderList = <OrderData>[].obs;
  RxBool canLoadMore = true.obs;
  RxInt page = 1.obs;

  Future<void> getOrder() async {
    isLoading.value = true;
    try {
      final response = await orderHisRepo.getOrder();
      if (response.statusCode == 200) {
        final OrderListModel orderModel = OrderListModel.fromJson(response.body);
        orderList.assignAll(orderModel.data!);
       // canLoadMore.value = orderModel.canLoadMore!;
      } else {
        ToastService.errorToast(response.body['message']);
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> getOrderDetail({required int id}) async {
    isLoading.value = true;
    try {
      final response = await orderHisRepo.getOrderDetail(id: id);
      if (response.statusCode == 200) {
        final OrderDetailModel orderModel = OrderDetailModel.fromJson(response.body);
        orderDetailData.value=orderModel.data!;
        // canLoadMore.value = orderModel.canLoadMore!;
      } else {
        ToastService.errorToast(response.body['message']);
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      isLoading.value = false;
    }
  }



  Color orderColor(String orderStatus) {
    switch (orderStatus) {
      case "pending":
        return Colors.orange;
      case "completed":
        return Colors.green;
      case "cancelled":
        return Colors.red;
      default:
        return Colors.orange;
    }
  }
}
