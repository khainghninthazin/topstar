import 'package:get/get.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/models/new_product.dart';

class NewArrivalDetailController extends GetxController {
  //TODO: Implement ProductDetailPageController

  var product = <NewProduct>[].obs;
    @override
  void onInit() {
    fetchProducts(); // Load products when the controller is initialized
    super.onInit();
  }


   void fetchProducts() {
    var productData = [
      NewProduct(
        id: 1,
        name: 'Green Hero',
        category: 'Action Figure',
        price: 20000,
        imageUrl: 'assets/img/nproduct1.png',
         color: AppColor.black
      ),
      NewProduct(
        id: 2,
        name: 'Samurai Boy',
        category: 'Adventure Toy',
        price: 20000,
        imageUrl: 'assets/img/nproduct2.png',
        color: AppColor.p2color
      ),
       NewProduct(
        id: 1,
        name: 'Green Hero',
        category: 'Action Figure',
        price: 20000,
        imageUrl: 'assets/img/nproduct3.png',
        color: AppColor.p3color
      ),
      NewProduct(
        id: 2,
        name: 'Samurai Boy',
        category: 'Adventure Toy',
        price: 20000,
        imageUrl: 'assets/img/nproduct1.png',
        color: AppColor.p4color
      ),
       NewProduct(
        id: 1,
        name: 'Green Hero',
        category: 'Action Figure',
        price: 20000,
        imageUrl: 'assets/img/nproduct3.png',
         color: AppColor.black
      ),
      NewProduct(
        id: 2,
        name: 'Samurai Boy',
        category: 'Adventure Toy',
        price: 20000,
        imageUrl: 'assets/img/nproduct1.png',
        color: AppColor.p2color
      ),
    ];

    product.assignAll(productData); 

 
}
}
