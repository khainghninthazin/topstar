import 'package:get/get.dart';
import 'package:top_star/core/app_widgets/view_image_screen.dart';
import 'package:top_star/screens/auth/forgot_pass.dart';
import 'package:top_star/screens/auth/login.dart';
import 'package:top_star/screens/auth/profile_update.dart';
import 'package:top_star/screens/auth/register.dart';
import 'package:top_star/screens/auth/verify_otp.dart';
import 'package:top_star/screens/checkout_screen/checkout_widgets/success_screen.dart';
import 'package:top_star/screens/filter_page.dart';
import 'package:top_star/screens/menu/change_password.dart';
import 'package:top_star/screens/menu/contact_us.dart';
import 'package:top_star/screens/menu/fav_screen.dart';
import 'package:top_star/screens/menu/privacy_policy.dart';
import 'package:top_star/screens/menu/update_password.dart';
import 'package:top_star/screens/nav/all_category_view.dart';
import 'package:top_star/screens/nav/all_popular_product_view.dart';
import 'package:top_star/screens/nav/filter_search_view.dart';
import 'package:top_star/screens/nav/nav_screen.dart';
import 'package:top_star/screens/nav/new_arrival_detail_view.dart';
import 'package:top_star/screens/nav/newfeed_detail.dart';
import 'package:top_star/screens/nav/product_detail_page_view.dart';
import 'package:top_star/screens/nav/search_result_view.dart';
import 'package:top_star/screens/noti.dart';
import 'package:top_star/screens/order_his_screen/order_his_detail_screen.dart';
import 'package:top_star/screens/order_his_screen/order_his_screen.dart';
import 'package:top_star/screens/product_detail_screen/product_detail_screen.dart';
import 'package:top_star/screens/search_page.dart';

import '../screens/checkout_screen/checkout_widgets/select_order_screen.dart';
import '../screens/checkout_screen/confirm_checkout_screen.dart';
import '../screens/checkout_screen/pay_now_check_out_screen.dart';
import '../screens/splash.dart';

class RouteHelper {
  static const String splash = "/splash";
  static const String main = "/main";
  static const String nav = "/nav";
  static const String feeddetail = "/feeddetail";
  static const String noti = "/noti";
  static const String search = "/search";
  static const String filter = "/filter";
  static const String orderhistory = "/orderhistory";
  static const String product_detail = "/product_detail";
  static const String confirmCheckoutScreen = "/confirmCheckoutScreen";
  static const String payNowCheckOutScreen = "/payNowCheckOutScreen";
  static const String selectDeliveryScreen = "/selectDeliveryScreen";
  static const String success = "/success";
  static const String fav = "/fav";
  static const String login = "/login";
  static const String register = "/register";

  static const String changePass = "/changePass";
  static const String updatePass = "/updatePass";

  static const String forgotPass = "/forgotPass";
  static const String verifyOTP = "/verifyOTP";
  static const String profileUpdate = "/profileUpdate";

  static const String orderHistoryDetail = "/orderHistoryDetail";
  static const String viewImage = "/viewImage";
  static const String newArrivalDetail = '/new-arrival-detail';
  static const String allpopularproduct = '/all_popular-product';
  static const String allcategory = '/all_category';
  static const String productdetail = '/product_detail_page';
  static const String fitsearch = '/filter_search_page';
  static const String searchresult = '/search_results_page';
  static const String privacyPolicy = "/privacyPolicy";
  static const String contactUs = "/contactUs";

  static List<GetPage> routes = [
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: nav,
        page: () => NavScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: noti,
        page: () => const NotiPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
      name: search,
      page: () {
        Get.arguments;
        SearchPage searchPage = Get.arguments;
        return searchPage;
      },
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
        name: filter,
        page: () => const FilterPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: login,
        page: () => const LoginPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: register,
        page: () => RegisterPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: orderhistory,
        page: () => const OrderHisScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: changePass,
        page: () => ChangePasswordPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: forgotPass,
        page: () => ForgotPassPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: verifyOTP,
        page: () => VerifyOtpPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
      name: orderHistoryDetail,
      page: () {
        Get.arguments;
        OrderHisDetailScreen orderhisDetail = Get.arguments;
        return orderhisDetail;
      },
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: product_detail,
      page: () {
        Get.arguments;
        ProductDetailScreen detailPage = Get.arguments;
        return detailPage;
      },
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: feeddetail,
      page: () {
        Get.arguments;
        NewfeedDetailPage newfeedDetailPage = Get.arguments;
        return newfeedDetailPage;
      },
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: profileUpdate,
      page: () {
        Get.arguments;
        UpdateProfilePage updateProfile = Get.arguments;
        return updateProfile;
      },
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
        name: selectDeliveryScreen,
        page: () => const SelectDeliveryScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: success,
        page: () => const SuccessScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: fav,
        page: () => const FavScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: updatePass,
        page: () => UpdatePasswordPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
      name: viewImage,
      page: () {
        Get.arguments;
        ViewImageScreen updateProfile = Get.arguments;
        return updateProfile;
      },
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
        name: confirmCheckoutScreen,
        page: () {
          Get.arguments;
          ConfirmCheckoutScreen confirmCheckoutScreen = Get.arguments;
          return confirmCheckoutScreen;
        },
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: payNowCheckOutScreen,
        page: () {
          Get.arguments;
          PayNowCheckOutScreen noticBoardDetailScreen = Get.arguments;
          return noticBoardDetailScreen;
        },
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
      name: newArrivalDetail,
      page: () => NewArrivalDetailView(),
    ),
    GetPage(
      name: allpopularproduct,
      page: () => AllPopularProductView(),
    ),
    GetPage(
      name: allcategory,
      page: () => AllCategoryView(),
    ),
    GetPage(
      name: productdetail,
      page: () => ProductDetailPage(),
    ),
    GetPage(
      name: fitsearch,
      page: () => FilterSearchView(),
    ),
    GetPage(
      name: searchresult,
      page: () => SearchResultView(),
    ),
    GetPage(
        name: privacyPolicy,
        page: () => const PrivacyPolicy(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: contactUs,
        page: () => const ContactUs(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 150)),
  ];
}
