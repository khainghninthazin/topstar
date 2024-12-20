
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../controllers/order_his_controller.dart';
import '../../core/app_widgets/back_button.dart';
import '../../core/app_widgets/custom_loading_widget.dart';
import '../../core/app_widgets/footer_widget.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/dimesions.dart';
import 'order_his_detail_screen.dart';
import 'ordet_his_widgets/order_info_card_widget.dart';

class OrderHisScreen extends StatefulWidget {
  const OrderHisScreen({super.key});

  @override
  State<OrderHisScreen> createState() => _OrderHisScreenState();
}

class _OrderHisScreenState extends State<OrderHisScreen> {
  final OrderHisController controller = Get.find<OrderHisController>();
  late RefreshController _refreshController;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){

      _refreshController = RefreshController(initialRefresh: false);
      controller.getOrder();

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHisController>(builder: (value){
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
            backgroundColor: AppColor.white,
            centerTitle: true,
            title: Text("Order History".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font18,fontWeight: FontWeight.bold),),
          ),
          body: GetBuilder<OrderHisController>(
            builder: (controller) => Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CustomLoadingWidget(),
                );
              } else if (controller.orderList.isEmpty) {
                return const Center(
                  child: Text("No order history"),
                );
              } else {
                return SmartRefresher(
                  controller: _refreshController,
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: _onRefresh,
                  footer: Obx(
                        () => footer(canLoadMore: controller.canLoadMore.value),
                  ),
                  onLoading: _onLoading,
                  header: const WaterDropHeader(),
                  physics: const BouncingScrollPhysics(),
                  child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: Dimesion.height10 / 2),
                      padding: EdgeInsets.all(Dimesion.width5),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.orderList.length,
                      itemBuilder: (context, index) => OpenContainer(
                          transitionDuration: const Duration(milliseconds: 500),
                          transitionType: ContainerTransitionType.fadeThrough,
                          closedBuilder: (_, close) => OrderInfoCardWidget(
                            orderColor: controller.orderColor(
                                controller.orderColor(controller.orderList[index].status.toString()).toString() ??
                                    ""), orderData: controller.orderList[index],
                          ),
                          openBuilder: (_, open) {
                            return OrderHisDetailScreen(
                              orderColor: controller.orderColor(
                                  controller.orderColor(controller.orderList[index].status.toString()).toString() ??
                                      ""), orderData: controller.orderList[index],
                            );
                          })),
                );
              }
            }),
          )

      );
    });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 300));
    controller.page.value = 1;
    controller.orderList.clear();
    controller.getOrder();
    _refreshController.refreshCompleted();
  }

  Future<void> _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (controller.canLoadMore.value) {
      controller.page.value++;
      controller.getOrder();
    } else {
      _refreshController.loadNoData();
    }
    _refreshController.loadComplete();
  }
}
