import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_detail_page_controller.dart';

class ProductDetailPageView extends GetView<ProductDetailPageController> {
  const ProductDetailPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductDetailPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductDetailPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
