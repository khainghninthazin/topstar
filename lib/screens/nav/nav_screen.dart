import 'dart:ui';

import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_star/controllers/product_controller.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/screens/nav/cart.dart';
import 'package:top_star/screens/nav/category.dart';
import 'package:top_star/screens/nav/home.dart';
import 'package:top_star/screens/nav/profile.dart';
import 'package:top_star/screens/nav/shop.dart';

import '../../core/constants/app_color.dart';
import 'nav_controller.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final productController = Get.find<ProductController>();
  final navController = Get.find<NavController>();


  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          child: BottomNavigationBar(
            
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: AppColor.primaryClr,
            unselectedItemColor: Colors.white.withOpacity(0.7),
            selectedItemColor: AppColor.white,
            items: [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/img/home_o.png"),size: Dimesion.size24,),label: "home".tr, backgroundColor: AppColor.primaryClr,activeIcon: ImageIcon(AssetImage("assets/img/home_f.png"),size: 24,)),
              
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/img/cat_o.png"),size: Dimesion.size24,),label: "category".tr, backgroundColor: AppColor.primaryClr,activeIcon: ImageIcon(AssetImage("assets/img/cat_f.png"),size: 24,)),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/img/cart_o.png"),size: Dimesion.size24,),label: "cart".tr, backgroundColor: AppColor.primaryClr,activeIcon: ImageIcon(AssetImage("assets/img/cart_f.png"),size: 24,)),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/img/user_o.png"),size: Dimesion.size24,),label: "profile".tr, backgroundColor: AppColor.primaryClr,activeIcon: ImageIcon(AssetImage("assets/img/user_f.png"),size: 24,)),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NavController(),
        builder: (controller){
          return ConnectivityWidget(
            
            offlineCallback: showNoInterNet,
            onlineCallback: navController.noInterNet.value==true?showRestoreInternet:null,
            showOfflineBanner: false,
            builder: (context, isOnline)  => Obx(()=>Scaffold(
              backgroundColor: AppColor.primaryClr,
              bottomNavigationBar: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: buildBottomNavigationMenu(context, controller),
                ),
              ),
              body: IndexedStack(
                index: navController.tabIndex.value,
                children: [
                  const HomePage(),
                
                  const CategoryPage(),
                  const CartPage(),
                  ProfilePage()
                ],
              ),
            )),
          );
    });
  }

  void showNoInterNet(){
    setState(() {
      navController.noInterNet.value=true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.wifi_off,color: Colors.white,),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child:  Text('No, Internet Connection',style: TextStyle(fontSize: 15,color: Colors.grey),),
            )
          ],
        ),
        backgroundColor: AppColor.blackless,
        behavior: SnackBarBehavior.floating,
      ),);
  }

  void showRestoreInternet(){
    productController.init();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.wifi,color: Colors.white,),
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child:  Text('Internet Connection Restored',style: TextStyle(fontSize: 15,color: Colors.white),),
            )
          ],
        ),
        backgroundColor: AppColor.blackless,
        behavior: SnackBarBehavior.floating,
      ),);

  }
}


