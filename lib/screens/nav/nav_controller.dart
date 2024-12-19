
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:top_star/screens/nav/cart.dart';
import 'package:top_star/screens/nav/category.dart';
import 'package:top_star/screens/nav/home.dart';
import 'package:top_star/screens/nav/profile.dart';
import 'package:top_star/screens/nav/shop.dart';


import '../../services/pref_service.dart';

class NavController extends GetxController  {

  var tabIndex = 0.obs;

  RxBool noInterNet=false.obs;

  List<Widget> screens = <Widget>[
    const HomePage(),
   
    const CategoryPage(),
    const CartPage(),
     ProfilePage()
  ].obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    noInterNet.value=false;
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /*Future<bool> checkLoginOrNot() async {
    var token = await prefService.getAppToken();
    if (token.isEmpty) {
      return false;
    } else {
      return true;
    }
  }*/
}
