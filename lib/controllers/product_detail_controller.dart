import 'package:get/get.dart';
import 'package:top_star/models/detail_model.dart';

class NewProductController extends GetxController {
  // Observable list of products
  var products = <DetailModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts(); // Load products when the controller is initialized
  }

  // Simulate fetching data (replace with an API call if needed)
  void fetchProducts() {
    var productData = [
      DetailModel(
        productId: '101',
        image: 'assets/img/detail_img.png',
        name: 'Sample Product',
        description:
            'Lorem ipsum dolor sit amet consectetur. Adipiscing dolor sit nunc dignissim faucibus arcu enim. Interdum morbi nulla feugiat nunc proin tincidunt. Nibh ut arcu libero quis sed pellentesque ipsum.',
        price: '20000',
        totalPrice: '20000',
        quantity: '1',
      ),
    ];

    products.assignAll(productData); // Update the product list
  }

  // Add a new product to the list
  void addProduct(DetailModel newProduct) {
    products.add(newProduct);
  }

  // Update an existing product in the list
  void updateProduct(String productId, DetailModel updatedProduct) {
    int index = products.indexWhere((product) => product.productId == productId);
    if (index != -1) {
      products[index] = updatedProduct;
    }
  }

  // Delete a product from the list
  void deleteProduct(String productId) {
    products.removeWhere((product) => product.productId == productId);
  }

  // Find a product by ID
  DetailModel? findProductById(String productId) {
    return products.firstWhereOrNull((product) => product.productId == productId);
  }
}
