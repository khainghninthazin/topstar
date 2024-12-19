import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_star/app/product_detail_page/controllers/controllers/product_detail_controller.dart';
import 'package:top_star/core/app_widgets/back_button.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  var pdcontroller = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    final ProductDetailController controller;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Detail',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Container(
            padding: EdgeInsets.all(Dimesion.size10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0), blurRadius: 1, color: AppColor.white)
              ],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite_border,
              color: AppColor.primaryClr,
              size: 20,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(right: Dimesion.width15,),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  right: 2,
                  top: 1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(
                          color: Colors.white, fontSize: Dimesion.font16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Image
              Container(
                padding: EdgeInsets.only(left: Dimesion.width10, right: Dimesion.width10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      margin: const EdgeInsets.all(20),
                      width: Dimesion.width20 * 10,
                      height: Dimesion.height20 * 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 2,
                              color: Colors.white)
                        ],
                      ),
                      child: Image.asset(
                        'assets/img/detail_img.png', // Replace with your image asset
                        fit: BoxFit.contain,
                      ),
                    ),
          
                    // Thumbnails
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: Dimesion.width30+20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                          (index) => Container(
                            margin: const EdgeInsets.only(right: 8),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black,
                              image: const DecorationImage(
                                image: AssetImage('assets/img/detail_img.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          
              const SizedBox(height: 17),
          
              // Product Information
              Container(
                // height: Dimesion.height20*20,
                decoration: BoxDecoration(
                    color: AppColor.bottomColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                padding: const EdgeInsets.all(20),
                child: Padding(
                  padding:  EdgeInsets.only(left: Dimesion.width10, right: Dimesion.width10, top: Dimesion.width10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Product 1',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Row(
                            children: [
                              Text(
                                ':Category',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimesion.font16),
                              ),
                              Divider(),
                              Text(
                                ':Brand',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimesion.font16),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Size: S',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            '20,000 Ks',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Lorem ipsum dolor sit amet consectetur. Adipiscing dolor sit nunc dignissim faucibus arcu enim. Interdum morbi nulla feugiat nunc proin tincidunt. Nibh ut arcu libero quis sed pellentesque ipsum.',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
              
                      const SizedBox(height: 20),
              
                      // Quantity Selector
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: const Text(
                                'Quantity',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (quantity > 1)
                                        quantity--; // Decrement quantity
                                    });
                                  },
                                  child: Stack(
                                    alignment: Alignment
                                        .center, // Ensures proper alignment of children
                                    children: [
                                      // Background Container
                                      Container(
                                        margin: const EdgeInsets.only(top: 2),
                                        height:
                                            25, // Adjusted size for better appearance
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: AppColor
                                                .primaryClr, // Replace with your primary color
                                            borderRadius: BorderRadius.circular(
                                                5) // Makes it circular
                                            ),
                                      ),
                                  
                                      // Positioned Icon Button
                                      Positioned(
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (quantity > 1)
                                                quantity--; // Decrement quantity
                                            });
                                          },
                                          icon: const Icon(Icons.remove,
                                              color:
                                                  Colors.white), // Icon styling
                                          iconSize: 20, // Adjust icon size
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '$quantity',
                                  style: TextStyle(
                                      fontSize: Dimesion.font16,
                                      color: Colors.black),
                                ),
                                Stack(
                                  alignment: Alignment
                                      .center, // Ensures proper alignment of children
                                  children: [
                                    // Background Container
                                    Container(
                                      margin: const EdgeInsets.only(top: 2),
                                      height:
                                          25, // Adjusted size for better appearance
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: AppColor
                                              .primaryClr, // Replace with your primary color
                                          borderRadius: BorderRadius.circular(
                                              5) // Makes it circular
                                          ),
                                    ),
                                  
                                    // Positioned Icon Button
                                    Positioned(
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                        icon: const Icon(Icons.add,
                                            color: Colors.white), // Icon styling
                                        iconSize: 20, // Adjust icon size
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: Dimesion.height10),
              
                      // Add to Cart Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Add to cart action
                          },
                          icon: const Icon(Icons.shopping_cart,
                              color: Colors.white),
                          label: Text(
                            'Add To Cart',
                            style: TextStyle(
                                color: Colors.white, fontSize: Dimesion.font16),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryClr,
                            padding: EdgeInsets.symmetric(
                                vertical: Dimesion.height5 * 3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimesion.height10,)
                    ],
                  ),
                ),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
