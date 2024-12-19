import 'package:get/get.dart';

import '../../../services/api_service.dart';
import '../core/constants/api_route_constants.dart';

class SearchRepo {
  final ApiClient apiClient;
  SearchRepo({required this.apiClient});


  Future<Response> getSearchProducts(
      {required int page,
        required String keywords,
        String? fromPrice,
        String? toPrice}) async {
    return await apiClient.getData(RouteConstant.getProductsSearch(
        page: page.toString(),
        search_key: keywords, limit: '10'));
  }
}
