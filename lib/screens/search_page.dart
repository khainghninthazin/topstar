import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:top_star/controllers/search_controller.dart';
import 'package:top_star/models/product_model.dart';
import 'package:top_star/screens/nav/productcard.dart';
import 'package:top_star/screens/nav/search_result_view.dart';
import 'package:top_star/screens/product_detail_screen/product_detail_screen.dart';

import '../controllers/product_controller.dart';
import '../core/app_widgets/back_button.dart';
import '../core/app_widgets/custom_loading_widget.dart';
import '../core/app_widgets/empty_view.dart';
import '../core/app_widgets/footer_widget.dart';
import '../core/app_widgets/my_text_filed.dart';
import '../core/constants/app_color.dart';
import '../core/constants/dimesions.dart';
import '../router/route_helper.dart';

class SearchPage extends StatefulWidget {
  final List<ProductData> datalist;
  SearchPage({super.key, required this.datalist});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final MySearchController controller = Get.find<MySearchController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.results.assignAll(widget.datalist);
      ;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySearchController>(builder: (builder) {
      return Scaffold(
          // appBar: AppBar(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.vertical(
          //       bottom: Radius.circular(Dimesion.radius15),
          //     ),
          //   ),
          //   toolbarHeight: Dimesion.screenHeight/11,
          //   leading: backButton(),
          //   backgroundColor: AppColor.bgColor,
          //   centerTitle: true,
          //   actions: [
          //     Gap(Dimesion.width10),
          //     InkWell(
          //       onTap: (){
          //         Get.toNamed(RouteHelper.filter);
          //       },
          //       child:Container(
          //             height: 40,
          //             width: 40, // Ensure a consistent aspect ratio
          //             decoration: BoxDecoration(
          //               color: AppColor
          //                   .primaryClr, // Use primary color for the container
          //               borderRadius:
          //                   BorderRadius.circular(12), // Rounded corners
          //             ),
          //             child: ClipRRect(
          //               borderRadius: BorderRadius.circular(
          //                   12), // Match the container's radius
          //               child: Image.asset(
          //                 'assets/img/image.png', // Replace with actual image path
          //                 fit: BoxFit
          //                     .contain, // Ensure the image fits within the container
          //               ),
          //             ),
          //           ),
          //     ),
          //     Gap(Dimesion.width10),

          //   ],
          //   title: PreferredSize(
          //       preferredSize: Size.fromHeight(Dimesion.height40),

          //       child: InkWell(
          //         onTap: () {
          //            Get.toNamed(RouteHelper.rescontroller,
          //                         arguments: SearchResultView(

          //                         ));
          //         },
          //         child: MyTextFieldWidget(
          //           controller: controller.searchController,
          //           isPasswords: false,

          //           prefixIcon: Icons.search,
          //           hintText: "Search Product".tr,
          //           inputType: TextInputType.text,
          //           inputAction: TextInputAction.search,
          //           onChanged: (val) {

          //              controller.page.value = 1;
          //               EasyDebounce.debounce(
          //                   'search', const Duration(milliseconds: 500), () async {
          //                 controller.results.clear();
          //                 await controller.getSearchProducts(isLoadMore: false);
          //               });
          //           }, height: Dimesion.height40,
          //         ),
          //       )),
          // ),
          // backgroundColor: Colors.white,
          // body: Obx(() {
          //   if (controller.isLoading.value) {
          //     return  Center(
          //       child: CustomLoadingWidget(),
          //     );
          //   } else if (controller.results.isEmpty) {
          //     return const EmptyViewWidget();
          //   } else {
          //     return SmartRefresher(
          //       controller: controller.refreshController,
          //       onRefresh: controller.onRefresh,
          //       footer: Obx(
          //             () => footer(canLoadMore: controller.canLoadMore.value),
          //       ),
          //       onLoading: controller.onLoading,
          //       enablePullDown: true,
          //       enablePullUp: true,
          //       header: const WaterDropHeader(),
          //       physics: const BouncingScrollPhysics(),
          //       child: controller.results.length!=0?
          //       Container(
          //         child: MasonryGridView.count(
          //           shrinkWrap: true,
          //           padding: EdgeInsets.all(Dimesion.width10),
          //           physics: NeverScrollableScrollPhysics(),
          //           scrollDirection: Axis.vertical,
          //           itemCount: controller.results.length,
          //           crossAxisCount: 2,
          //           mainAxisSpacing: Dimesion.screenHeight/45,
          //           crossAxisSpacing: Dimesion.screeWidth/17,
          //           itemBuilder: (context, index) {
          //             return GestureDetector(
          //               onTap: (){
          //                 Get.toNamed(RouteHelper.product_detail,arguments: ProductDetailScreen(data: controller.results[index]));
          //               },
          //               child: ProductCardWidget(data: controller.results[index],),
          //             );
          //           },
          //         ),
          //       ):Container()
          //     );
          //   }
          // }),

          appBar: AppBar(
            leading: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios)),
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            const SizedBox(
              height: 30,
            ),

            // Search Bar
            Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Row(children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(RouteHelper.searchresult,
                            arguments: SearchResultView());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(Dimesion.width5),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 5,
                                  color: Colors.black12)
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimesion.width10)),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.search,
                              size: Dimesion.iconSize25,
                              color: AppColor.primaryClr,
                            ),
                            Gap(Dimesion.width5),
                            Text(
                              "search".tr,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Dimesion.font16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Gap(Dimesion.width15),
                InkWell(
                  onTap: () {
                    // Navigate to the filter screen
                    Get.toNamed(RouteHelper.filter);
                  },
                  child: Container(
                    height: 40,
                    width: 40, // Ensure a consistent aspect ratio
                    decoration: BoxDecoration(
                      color: AppColor
                          .primaryClr, // Use primary color for the container
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          12), // Match the container's radius
                      child: Image.asset(
                        'assets/img/image.png', // Replace with actual image path
                        fit: BoxFit
                            .contain, // Ensure the image fits within the container
                      ),
                    ),
                  ),
                ),
                ])),

                 
          ])),
          body: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return  Container(
              padding: EdgeInsets.only(left: 30),
              child:  Column(
               
                children: [
                  ListTile(
                    leading: Image(image: AssetImage('assets/png/clock.png',),height: Dimesion.height20,color: Colors.grey,),
                    title: Text('Productname1',style: TextStyle(color: Colors.grey),),
                  ),
                   
                ],
              ),
            );
            },
           ) );
           
          
        
    });
  }
}
