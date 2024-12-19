
import 'package:get/get.dart';

import 'package:top_star/controllers/order_his_controller.dart';
import 'package:top_star/controllers/product_controller.dart';
import 'package:top_star/controllers/search_controller.dart';
import 'package:top_star/repository/order_his_repo.dart';
import 'package:top_star/repository/product_repo.dart';


import '../controllers/auth_controller.dart';
import '../controllers/cart_controller.dart';
import '../controllers/checkout_controller.dart';
import '../controllers/fav_controller.dart';
import '../repository/auth_repo.dart';
import '../repository/cart_repo.dart';
import '../repository/check_out_repo.dart';
import '../repository/fav_repo.dart';
import '../repository/search_repo.dart';
import '../screens/nav/nav_controller.dart';
import '../services/api_service.dart';
import '../services/pref_service.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
   /* Get.put(
        AuthRepo(
            apiClient: Get.find<ApiClient>(),
            prefService: Get.find<PrefService>()),
        permanent: true);*/

    //* Controllers
   // Get.put(AuthController(authRepo: Get.find<AuthRepo>()), permanent: true);
   // Get.put(MainController());
    Get.put(
        AuthRepo(
            apiClient: Get.find<ApiClient>(),
            prefService: Get.find<PrefService>()),
        permanent: true);

    Get.put(
        ProductRepo(
            apiClient: Get.find<ApiClient>(),
            prefService: Get.find<PrefService>()),
        permanent: true);
    Get.put(
        SearchRepo(
            apiClient: Get.find<ApiClient>()),
        permanent: true);
    Get.put(
        CartRepo(
            apiClient: Get.find<ApiClient>(),
            prefService: Get.find<PrefService>()),
        permanent: true);
    Get.put(
        OrderHisRepo(
            apiClient: Get.find<ApiClient>()),
        permanent: true);
    Get.lazyPut(() => CheckOutRepo(
        apiClient: Get.find<ApiClient>(),
        prefService: Get.find<PrefService>()));
    Get.put(FavRepo(
        apiClient: Get.find<ApiClient>(),
        prefService: Get.find<PrefService>()));
    Get.put(NavController(), permanent: true);

    Get.put(AuthController(authRepo: Get.find<AuthRepo>()), permanent: true);

     


    Get.put(
        FavController(
          favRepo: Get.find<FavRepo>(),
        ),
        permanent: true);
    Get.put(
        CartController(
          cartRepo: Get.find<CartRepo>(),
          favController: Get.find<FavController>(),),
        permanent: true);
    Get.put(
        ProductController(
            productRepo: Get.find<ProductRepo>(),
            cartController: Get.find<CartController>(),
            authController: Get.find<AuthController>(),
            favController: Get.find<FavController>(),
            navController: Get.find<NavController>()),
        permanent: true);
    Get.put(
        MySearchController(
          searchRepo: Get.find<SearchRepo>(),
        ),
        permanent: true);
    Get.put(OrderHisController(
        orderHisRepo: Get.find<OrderHisRepo>()));
    Get.put(CheckOutController(
        checkOutRepo: Get.find<CheckOutRepo>(),
        cartController: Get.find<CartController>()));
    
    
    

  }
}
