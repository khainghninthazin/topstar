class RouteConstant {
  static const String baseUrl = "https://sea.ecommyanmar.com/"+apiV;
  static const String apiV = "api/v1/";
  static const String login = "login";
  static const String logout = "logout";
  static const String register = "register";
  static const String customer = "customer";
  static const String update_profile = "customer?_method=PUT";
  static const String change_password = "customer/update-password?_method=PUT";
  static const String posts = "posts";
  static String regions = "regions";
  static String banners = "banners";
  static String deliveryFee = "delivery-fees";

  static String comment({required int id}) =>
      "posts/$id/comment";

//*Banner
  static const String banner = "dashboard/banners";
  static String updateBanner({required int bannerid}) =>
      "dashboard/banners/$bannerid";

//*Variations
  static String getVariatrions({required int page, required String keywords}) =>
      "variations?keyword=$keywords&page=$page";
  static String updateVariation({required int id, required String val}) =>
      "variations/$id?name=$val";
  static String deleteVariation({required int id}) =>
      "variations/$id";
  static String createVariation = "dashboard/variations";
//*Products
  static String getPoroducts({required String page, required String limit}) =>
      "products?page=$page&limit=$limit";

  static String getProductsSearch({required String page, required String limit,required String search_key}) =>
      "products?page=$page&limit=$limit&search_key=$search_key";
  static String getPosts({required String page, required String limit}) =>
      "posts?page=$page&limit=$limit";
  static String getPostDetail({required int postID}) =>
      "posts/$postID";

//* Product Images
  static String forgotpassword = "forgot-password";
  static String verify_forgotpassword = "forgot-password-code/verify";
  static const String update_password = "update-password";


  static String deleteProductImage({required int id}) =>
      "product-images/$id";
//* Product Voice
  static String orders = "orders";
  static String orderDetail({required int id}) =>
      "orders/$id";
//* Product Variations
  static String createProductVariation = "product-variations";
  static String updateProductVariation({required int id}) =>
      "product-variations/$id";


//*Brands
  static String brands = "brands";
  static String updateBrand({required int id}) => "brands/$id";

//* Categories
  static String categories = "categories";
  static String upDateCategory({required int id}) => "categories/$id";

//* Payments
  static String payments = "payments";


}
