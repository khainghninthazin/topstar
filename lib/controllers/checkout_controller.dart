import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_star/models/cart_model.dart';
import 'package:top_star/models/deli_fee_model.dart';
import 'package:top_star/services/cart_save.dart';


import '../../../repository/check_out_repo.dart';
import '../core/app_widgets/custom_loading_widget.dart';
import '../models/payment_model.dart';
import '../models/region_model.dart';
import '../router/route_helper.dart';
import '../screens/checkout_screen/checkout_widgets/success_screen.dart';
import '../screens/checkout_screen/confirm_checkout_screen.dart';
import '../services/toast_service.dart';
import 'cart_controller.dart';

class CheckOutController extends GetxController {
  final CheckOutRepo checkOutRepo;
  final CartController cartController;
  CheckOutController(
      {required this.checkOutRepo, required this.cartController});

  @override
  onInit() {
    getRegions();
    getDeliveryFees();
    getPayments();
    super.onInit();
  }
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  RxList<RegionData> regionList = <RegionData>[].obs;
  RxList<CartModel> cartList = <CartModel>[].obs;

  RxInt totalQty = 0.obs;
  RxInt totalAmt = 0.obs;


  /*onChageRegion(RegionData val) {
    selectedRegion.value = val.name!;
    selectedRegionId.value = val.id!;
    selectedTownShip.value = "---";
    selectedTownShipId.value = 0;
    deliveryList.clear();
    selectedDelivery.value = DeliveryData();
    searchDeliveryData.value = SearchDeliveryData();
    deliState.value = DeliveryState.empty;
    getTownShips(regionId: selectedRegionId.value);
  }

  onChangeTownShip(DeliveryFeeData townShipData) {
    selectedTownShipId.value = townShipData.id!;
    deliveryList.clear();
    deliState.value = DeliveryState.empty;
    searchDeliveryData.value = SearchDeliveryData();
    getDeliveries(townId: selectedTownShipId.value);
  }*/

  RxInt selectedRegionId = 0.obs;

  Rx<RegionState> regionState = RegionState.empty.obs;
  Future<void> getRegions() async {
    regionState.value = RegionState.loading;
    try {
      final response = await checkOutRepo.getRegions();
      print(response.body.toString());
      if (response.statusCode == 200) {
        final RegionModel regionModel = RegionModel.fromJson(response.body);
        regionList.assignAll(regionModel.data!);

        regionState.value = RegionState.success;
      }
    } catch (e) {
      regionState.value = RegionState.error;
      ToastService.errorToast(e.toString());
    } finally {
      regionState.value = RegionState.success;
    }
  }
  Rx<DeliveryFeeData> searchDeliveryData = DeliveryFeeData().obs;

  RxInt selectedDeliveryFeeId = 0.obs;
  RxString selectedRegion = "---".obs;
  RxList<DeliveryFeeData> townShipList = <DeliveryFeeData>[].obs;
  RxInt selectedDeliFee = 0.obs;
  RxInt qty = 1.obs;


  Rx<DeliveryState> deliState = DeliveryState.empty.obs;
  Future<void> getDeliveryFees() async {
    deliState.value = DeliveryState.loading;
    try {
      Response response = await checkOutRepo.getDeliveryFee();
      print(response.body.toString());

      if (response.statusCode == 200) {
        DeliveryFeeModel data = DeliveryFeeModel.fromJson(response.body);
        townShipList.assignAll(data.data!);
        if (townShipList.isEmpty) {
          ToastService.warningToast("No Results");
          deliState.value = DeliveryState.empty;
        }
        deliState.value = DeliveryState.success;
      } else {
        deliState.value = DeliveryState.error;
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
      deliState.value = DeliveryState.error;
    }
  }

  Rx<PaymentData> selectedPayment = PaymentData().obs;
  RxList<PaymentData> paymentList = <PaymentData>[].obs;
  RxBool isLoadingPayment = false.obs;
  RxString selectedTownShip = "---".obs;

  Future<void> getPayments() async {

    isLoadingPayment.value = true;
    try {
      Response response = await checkOutRepo.getPayments();
      if (response.statusCode == 200) {
        PaymentModel data = PaymentModel.fromJson(response.body);
        paymentList.assignAll(data.data!);

      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      isLoadingPayment.value = false;
    }
  }

  onSelectPayment(PaymentData paymentData) {
    selectedPayment.value = paymentData;
  }

  changeQuantity({required bool isIncrease,required int product_id}) {
    if (isIncrease == true) {
      qty.value++;
    } else {
      if (qty > 1) {
        qty.value--;
      } else {
        ToastService.warningToast("Quantity can't be less than 1");
      }
    }
    for (var map in cartList) {
      if (map.productId == product_id) {
        map.quantity=qty.value;
      }
    }
    cartList.refresh();
    calculate_total();
  }

  void calculate_total(){
    totalQty.value=0;
    totalAmt.value=0;
    for (var i = 0; i < cartList.length; i++) {
      totalQty.value+=cartList[i].quantity!;
      totalAmt.value+=int.parse(cartList[i].price.toString()) * int.parse(cartList[i].quantity.toString());
    }

  }

  changeCartQuantity({required bool isIncrease,required int product_id,required int qty}) {
    if (isIncrease == true) {
      qty++;
    } else {
      if (qty > 1) {
        qty--;
      } else {
        ToastService.warningToast("Quantity can't be less than 1");
      }
    }

    for (var map in cartList) {
      if (map.productId == product_id) {
        map.quantity=qty;
      }

    }
    cartList.refresh();

    calculate_total();

  }

  Future<void> postOrder({required bool isCod}) async {
    var loading = BotToast.showCustomLoading(
        toastBuilder: (_) => const Center(
          child: CustomLoadingWidget(),
        ));
    List<dynamic> dataList=[];
    dataList.clear();
    for (var i = 0; i < cartList.length; i++) {
      var data;
      if(cartList[i].variation.toString()!="null"){
         data={"product_id": cartList[i].productId.toString(), "product_variation_id": cartList[i].productVarientId.toString(), "quantity": cartList[i].quantity.toString(), "color": cartList[i].variation!.variationName.toString(), "price": cartList[i].price.toString(), "total_price": cartList[i].totalPrice.toString()};
      }else{
        data={"product_id": cartList[i].productId.toString(),"product_variation_id": null, "quantity": cartList[i].quantity.toString(),"price": cartList[i].price.toString(), "total_price": cartList[i].totalPrice.toString()};
      }
      dataList.add(data);
     /* CartOrderModel orderModel=CartOrderModel(productId: cartList[i].productId.toString(), quantity: cartList[i].quantity.toString(), color: cartList[i].variation!.variationName.toString(), price: cartList[i].price, totalPrice: cartList[i].totalPrice.toString(),productVariationId: cartList[i].variation!.variationId.toString());
      */
    }
    print(dataList.toString());
    FormData formData;
    if(isCod){
      print("CODOrder");
      formData = FormData({
        "region_id": selectedRegionId.value.toString(),
        "delivery_fee_id": selectedDeliveryFeeId.value.toString(),
        "delivery_fee":  selectedDeliFee.value.toString(),
        "carts": jsonEncode(dataList),
        "name": nameController.text,
        "phone": phoneController.text,
        "address": addressController.text,
        "payment_method": "cod"
      });
    }else{
      print("PaymentOrder");
      formData = FormData({
      "name": nameController.text,
        "address": addressController.text,
        "phone": phoneController.text,
       "payment_method": "payment",
        "payment_id": selectedPayment.value.id.toString(),
        "payment_photo": MultipartFile(pickedImagePath, filename: "payment.png"),
        "carts": jsonEncode(dataList),
        "region_id": selectedRegionId.value.toString(),
        "delivery_fee_id": selectedDeliveryFeeId.value.toString(),
        "delivery_fee":  selectedDeliFee.value.toString(),
      });
    }
    
    print("FormData>>"+formData.fields.toString());

    try {
      Response response = await checkOutRepo.postOrder(data: formData);
      print("OrderRespon>>>"+response.body.toString());
      if (response.statusCode == 200) {
        removeDataAll();
        cartClear();
       // ToastService.successToast("Successfully Order Create");
        loading();
        Get.offNamed(RouteHelper.success,
            arguments: SuccessScreen());
      } else {
        print("Error>>>"+response.body["message"]);
        ToastService.errorToast(response.body["message"]);
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
      loading();
    } finally {
      loading();
    }
  }

  /*
  RxList<DeliveryData> deliveryList = <DeliveryData>[].obs;
  RxString selectedRegion = "---".obs;
  RxString selectedTownShip = "---".obs;

  RxInt selectedTownShipId = 0.obs;
  Rx<DeliveryData> selectedDelivery = DeliveryData().obs;



  onTapTownShip() {
    if (selectedRegion.value == "---") {
      ToastService.warningToast("Please Select Region First");
    }
  }

  Rx<DeliveryState> deliState = DeliveryState.empty.obs;
  Future<void> getDeliveries({required int townId}) async {
    BotToast.showCustomLoading(
        toastBuilder: (_) => const Center(
          child: CustomLoadingWidget(),
        ));
    deliState.value = DeliveryState.loading;
    try {
      Response response = await checkOutRepo.getDelivery(townId: townId);
      if (response.statusCode == 200) {
        BotToast.closeAllLoading();
        DeliveryModel data = DeliveryModel.fromJson(response.body);
        deliveryList.assignAll(data.data!);
        if (deliveryList.isEmpty) {
          ToastService.errorToast("This TownShip is No Delivery");
          deliState.value = DeliveryState.empty;
        }
        deliState.value = DeliveryState.success;
      }
    } catch (e) {
      BotToast.closeAllLoading();
      ToastService.errorToast(e.toString());
      deliState.value = DeliveryState.error;
    }
  }

  onChangeDelivery(DeliveryData deliveryData) {
    selectedDelivery.value = deliveryData;
    getSearchDelivery();
  }

  RxBool isLoadingSearch = false.obs;
  Future<void> getSearchDelivery() async {
    isLoadingSearch.value = true;
    try {
      Response response = await checkOutRepo.getSearchDelivery(
          townId: selectedTownShipId.value,
          deliveryId: selectedDelivery.value.id!);
      if (response.statusCode == 200) {
        SearchDeliveryModel data = SearchDeliveryModel.fromJson(response.body);
        searchDeliveryData.value = data.data!;
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      isLoadingSearch.value = false;
    }
  }*/
//* Reset Checkout Screen ------------->

  /*resetCheckoutSelection() {
    selectedRegion.value = "---";
    selectedTownShip.value = "---";
    selectedDelivery.value = DeliveryData();
    searchDeliveryData.value = SearchDeliveryData();
    townShipList.clear();
    deliveryList.clear();
    deliState.value = DeliveryState.empty;
    nameController.clear();

    phoneController.clear();
    addressController.clear();
  }*/

//* Get PayMents ----->

  /**/

  //* SelectPaymentImage =============>

  void cartClear(){
    cartList.clear();
    totalAmt.value=0;
    totalQty.value=0;
  }

  File? pickedImagePath;

  XFile? pickedFile;

  final picker = ImagePicker();
  Future<void> pickImage() async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      XFile image = XFile(pickedFile!.path);
      pickedImagePath = File(image.path);
      update();
    }
  }

  onClearImage() {
    pickedImagePath = null;
    update();
  }

  validateCodForConfirmCheckout() {
    if (selectedRegion.value == "---") {
      ToastService.warningToast("Please Select Region");
    } else if (selectedTownShip.value == "---") {
      ToastService.warningToast("Please Select Township");
    } else if (searchDeliveryData.value.region!.cod.toString() == "0") {
      ToastService.warningToast("Service not avaliable.");
    } else {
      Get.toNamed(RouteHelper.confirmCheckoutScreen,
          arguments: ConfirmCheckoutScreen(isCod: true));
    }

  }

  validatePayNowForConfirmCheckout() {
    if (selectedRegion.value == "---") {
      ToastService.warningToast("Please Select Region");
    } else if (selectedTownShip.value == "---") {
      ToastService.warningToast("Please Select Township");
    }else{
      Get.toNamed(RouteHelper.confirmCheckoutScreen,
          arguments: ConfirmCheckoutScreen(isCod: false));
    }

  }
  //* For Confirm Checkout----->
  /*





  */
}

enum RegionState { loading, success, error, empty }


enum DeliveryState { loading, success, error, empty }
