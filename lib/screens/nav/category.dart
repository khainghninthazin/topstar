import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/dimesions.dart';
import 'brands.dart';
import 'categorys.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final ProductController controller = Get.find<ProductController>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (value) {
      return Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Category'.tr,
            style: TextStyle(
              color: Colors.black,
              fontSize: Dimesion.font18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            // TabBar Container
            Container(
              
              height: 50,
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                controller: tabController,
                isScrollable: false, // Prevent scroll (optional)
                indicator: BoxDecoration(
                  color: AppColor.primaryClr, // Selected tab background color
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                ),
                indicatorSize: TabBarIndicatorSize.tab, // Full tab width
                labelColor: Colors.white, // Selected text color
                unselectedLabelColor: Colors.black, // Unselected text color
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    child: Text(
                      "Category",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Brand",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            // TabBarView Content
            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(left:Dimesion.width5,right:Dimesion.width5  ),
                child: TabBarView(
                  controller: tabController,
                  children: [
                    CategoryWidget(controller: controller),
                    BrandWidget(controller: controller),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
