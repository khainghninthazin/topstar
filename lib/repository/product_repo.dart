import 'package:get/get.dart';

import '../core/constants/api_route_constants.dart';
import '../services/api_service.dart';
import '../services/pref_service.dart';

class ProductRepo {
  final ApiClient apiClient;
  final PrefService prefService;
  ProductRepo({required this.apiClient, required this.prefService});

  Future<Response> getAllProducts({required int page}) async {
    return await apiClient.getData(RouteConstant.getPoroducts(page: page.toString(), limit: '10'));
  }


  Future<Response> getPostDetail({required int id}) async {
    return await apiClient.getData(RouteConstant.getPostDetail(postID: id));
  }

  Future<Response> getComment({required int id,required FormData data}) async {
    return await apiClient.postFormData(RouteConstant.comment(id: id),data);
  }

  Future<Response> getAllPost({required int page}) async {
    return await apiClient.getData(RouteConstant.getPosts(page: page.toString(), limit: '10',));
  }

  Future<Response> getBrand() async {
    return await apiClient
        .getData(RouteConstant.brands);
  }

  Future<Response> getBanner() async {
    return await apiClient
        .getData(RouteConstant.banners);
  }

  Future<Response> getCategory() async {
    return await apiClient
        .getData(RouteConstant.categories);
  }
  /*

  Future<Response> getProductDetail({required int id}) async {
    return await apiClient.getData(RouteConstant.getProductDetail(id: id));
  }



  Future<Response> getProductVariationPrice(
      {required int id, required String variation, required String val}) async {
    return await apiClient.postFormData(RouteConstant.getProductVariations,
        FormData({"product_id": id, "variations[$variation]": val}));
  }*/
}
