import 'package:bot_toast/bot_toast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_star/models/banner_model.dart';
import 'package:top_star/models/brand_model.dart';
import 'package:top_star/models/category_model.dart';
import 'package:top_star/models/post_detail_model.dart';
import 'package:top_star/models/post_model.dart';


import '../core/app_widgets/custom_loading_widget.dart';
import '../models/product_model.dart';
import '../repository/product_repo.dart';
import '../screens/nav/nav_controller.dart';
import '../services/toast_service.dart';
import 'auth_controller.dart';
import 'cart_controller.dart';
import 'fav_controller.dart';


class ProductController extends GetxController with StateMixin {
  final ProductRepo productRepo;
  final CartController cartController;
  final AuthController authController;
  final FavController favController;
  final NavController navController;
  ProductController(
      {required this.productRepo,
      required this.cartController,
      required this.authController,
      required this.favController,
      required this.navController});
  RxBool isFavorite = false.obs;
  RxBool isReply = false.obs;
  RxInt parent_id = 0.obs;

  RxInt replyID = 0.obs;


  RxBool isLoading = false.obs;
  final CarouselSliderController carouselController = CarouselSliderController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController replyController = TextEditingController();

  RxList<ProductData> allProducts = <ProductData>[].obs;
  RxList<PostData> allPosts = <PostData>[].obs;

  RxInt allProductPage = 1.obs;

  RxBool allProductCanloadMore = false.obs;
  String productValueVariation = "";

  Future<void> getAllProducts({required bool isLoadmore}) async {

    try {
      final response =
      await productRepo.getAllProducts(page: allProductPage.value);
      print(response.body.toString());
      if (response.statusCode == 200) {
        final ProductModel productModel = ProductModel.fromJson(response.body);
        allProducts.addAll(productModel.data!);

        allProductCanloadMore.value = productModel.canLoadMore!;
        change(allProducts, status: RxStatus.success());
      } else {
        change(allProducts, status: RxStatus.error(response.bodyString));
      }
    } catch (e) {
      change(allProducts, status: RxStatus.error(e.toString()));
    }
  }


  RxBool canLoadMorePost = false.obs;
  RxInt page_post = 1.obs;

  Future<void> getAllPosts({required bool isLoadmore}) async {

    try {
      final response =
      await productRepo.getAllPost(page: page_post.value);
      print("ResponPost>>>"+response.body.toString());
      if (response.statusCode == 200) {

        final PostModel postModel = PostModel.fromJson(response.body);
        allPosts.assignAll(postModel.data!);

        canLoadMorePost.value = postModel.canLoadMore!;
        change(allPosts, status: RxStatus.success());
      } else {
        change(allPosts, status: RxStatus.error(response.bodyString));
      }
    } catch (e) {
      change(allPosts, status: RxStatus.error(e.toString()));
    }
  }

  RxBool moreLoading = false.obs;

  Future<void> getAllPostsMore({required bool isLoadmore}) async {
    moreLoading.value=true;
    await Future.delayed(const Duration(milliseconds: 300));

    try {
      final response =
      await productRepo.getAllPost(page: page_post.value);
      print(response.body.toString());
      if (response.statusCode == 200) {

        final PostModel postModel = PostModel.fromJson(response.body);
        allPosts.addAll(postModel.data!);
        canLoadMorePost.value = postModel.canLoadMore!;
        change(allPosts, status: RxStatus.success());
        moreLoading.value=false;
      } else {
        change(allPosts, status: RxStatus.error(response.bodyString));
        moreLoading.value=false;

      }
    } catch (e) {
      change(allPosts, status: RxStatus.error(e.toString()));
      moreLoading.value=false;

    }
  }




  RxList<CategoryData> categorylist = <CategoryData>[].obs;
  RxInt productByCategoryPage = 1.obs;
  RxBool productByCategoryCanloadMore = false.obs;

  Future<void> getAllCategory() async {

    try {
      final response = await productRepo.getCategory();
      if (response.statusCode == 200) {
        final CategoryModel categoryModel = CategoryModel.fromJson(response.body);
        categorylist.assignAll(categoryModel.data!);

        change(categorylist, status: RxStatus.success());
      } else {
        change(categorylist, status: RxStatus.error(response.bodyString));
      }
    } catch (e) {
      change(categorylist, status: RxStatus.error(e.toString()));
    }
  }

  RxList<BrandData> brandlist = <BrandData>[].obs;
  RxInt productByBrandPage = 1.obs;
  RxBool productByBrandCanloadMore = false.obs;

  Future<void> getAllBrand() async {
    try {
      final response = await productRepo.getBrand();
      if (response.statusCode == 200) {
        final BrandModel brandModel = BrandModel.fromJson(response.body);
        brandlist.assignAll(brandModel.data!);

        change(brandlist, status: RxStatus.success());
      } else {
        change(brandlist, status: RxStatus.error(response.bodyString));
      }
    } catch (e) {
      change(brandlist, status: RxStatus.error(e.toString()));
    }
  }

  RxList<BannerData> bannerList = <BannerData>[].obs;


  Future<void> getBanner() async {
    try {
      final response = await productRepo.getBanner();
      if (response.statusCode == 200) {
        final BannerModel bannerModel = BannerModel.fromJson(response.body);
        bannerList.assignAll(bannerModel.data!);

        change(bannerList, status: RxStatus.success());
      } else {
        change(bannerList, status: RxStatus.error(response.bodyString));
      }
    } catch (e) {
      change(bannerList, status: RxStatus.error(e.toString()));
    }
  }
    /*

  Rx<AddToCartModel> toCartModel = AddToCartModel().obs;

  Rx<ProductDetailData> productDetail = ProductDetailData().obs;
  RxBool isFavorite = false.obs;
  RxBool isLoading = false.obs;

  Future<void> getProductDetail({required int id}) async {
    productDetail.value = ProductDetailData();
    resetProductScreen();
    isLoading.value=true;

    try {
      final response = await productRepo.getProductDetail(id: id);

      if (response.statusCode == 200) {
        final ProductDetailModel productDetailModel =
            ProductDetailModel.fromJson(response.body);
        productDetail.value = productDetailModel.data!;
        print("Variant>>>"+response.body.toString());
        isFavorite.value = productDetail.value.isFavourite ?? false;
        productPrice.value =
            productDetailModel.data!.productVariation!.first.sellPrice!;
        _total.value =
        productDetailModel.data!.productVariation!.first.sellPrice!;
        _price.value =
            productDetailModel.data!.productVariation!.first.stockQuantity!;
        avaliableVariations.value = productDetail.value.variations!;
        selectedVIndex.assignAll(List.generate(
            productDetail.value.variations!.length, (index) => 0));
        selectedValues.assignAll(List.generate(
            productDetail.value.variations!.length, (index) => "Select"));
        isLoading.value=false;

      } else {
        ToastService.errorToast("Error ${response.statusText}");
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      //loading();
    }
  }

  final CarouselSliderController carouselController = CarouselSliderController();
  Rx<ProductVariationSearch> productvariation = ProductVariationSearch().obs;
  RxInt imgIndex = 0.obs;
  RxInt currentWHIndex = 0.obs;
  RxInt wholeSaleID = 0.obs;
  RxInt productPrice = 0.obs;
  RxInt _stock = 0.obs;
  RxInt _price = 0.obs;

  final RxInt _total=0.obs;

  RxList<int?> selectedVIndex = <int?>[].obs;
  RxList<String> selectedValues = <String>[].obs;
  RxList<Variation> avaliableVariations = <Variation>[].obs;
  RxBool isGettingVariations = false.obs;
  RxBool isWholeSale = false.obs;
  RxInt selectedVariationId = 0.obs;
  int get select_variant_id => selectedVariationId.value;


  RxString img_code = "".obs;
  int get total => _total.value;
  int get qty => detailQuantity.value;
  int get price => _price.value;
  int get stock => _stock.value;

  RxInt detailQuantity = 1.obs;

  onChangePrice() {
    _price.value = productvariation.value.productVariation!.sellPrice!;
    detailQuantity.value=1;
    _total.value = price * detailQuantity.value;
  }

  changeQuantity({required bool isIncrease}) {
    if (isIncrease == true) {
      detailQuantity.value++;
    } else {
      if (qty > 1) {
        detailQuantity.value--;
      } else {
        ToastService.warningToast("Quantity can't be less than 1");
      }
    }
    _total.value=_price.value*detailQuantity.value;
    _total.value = _price.value * detailQuantity.value;
  }

  Future<void> getProductVariPrice(
      {required String variation, required String val}) async {
    isGettingVariations.value = true;
    isLoading.value=true;
    print("SelectedVariationId variation: $variation");
    print("SelectedVariationId val: $val");

    try {
      final response = await productRepo.getProductVariationPrice(
          id: productDetail.value.product!.id!, variation: variation, val: val);
      if (response.statusCode == 200) {
        final ProductVariationsSearchModel productVariationModel =
            ProductVariationsSearchModel.fromJson(response.body);
        print("Respon>>>"+response.body.toString());
        productvariation.value = productVariationModel.data!;
        selectedVariationId.value = productvariation.value.productVariation!.id!;
        productPrice.value = productVariationModel.data!.productVariation!.sellPrice!;
        _price.value = productVariationModel.data!.productVariation!.sellPrice!;
        _stock.value = productVariationModel.data!.productVariation!.stockQuantity!;
        avaliableVariations.value = productVariationModel.data!.variations!;
        onChangePrice();
        img_code.value=productVariationModel.data!.productVariation!.image!;

        print("SelectedVariationId Select: ${productvariation.value.productVariation!.id!}");
        isLoading.value=false;
      } else {
        ToastService.errorToast(response.body["message"]);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isGettingVariations.value = false;
      isLoading.value=false;

    }
  }

  resetProductScreen() {
    img_code.value="";
    imgIndex.value = 0;
    productPrice.value = 0;
    _total.value=0;
    _stock.value = 0;
    selectedVIndex.value = [];
    wholeSaleID.value=0;
    isWholeSale.value=false;
    selectedVariationId.value=0;
    cartController.detailQuantity.value = 1;
  }


  onSelectColor({int? val, int? vIndex}) {
    print("OnSelectColor: $val");

    selectedVIndex[vIndex!] = val!;
    selectedValues[vIndex] =
        productDetail.value.variations![vIndex].values![val];
    productValueVariation =
        productDetail.value.variations![vIndex].values![val];
    print("OnSelectColor: $productValueVariation");

    cartController.detailQuantity.value = 1;
    getProductVariPrice(
        variation: avaliableVariations[vIndex].name!,
        val: selectedValues[vIndex]);
  }

  onClearSelection() {
    selectedValues.assignAll(List.generate(
        productDetail.value.variations!.length, (index) => "Select"));
    avaliableVariations.value = productDetail.value.variations!;
    cartController.detailQuantity.value = 1;
  }

  onSelectVariations({String? val, int? vIndex}) {
    selectedVIndex[vIndex ?? 0] =
        productDetail.value.variations?[vIndex ?? 0].values?.indexOf(val ?? "");
    selectedValues[vIndex ?? 0] = val ?? "";

    for (int i = 0; i < selectedVIndex.length; i++) {
      if (i != vIndex) {
        // selectedVIndex[i] = null;
        // selectedValues[i] = "Select";
        break;
      }
    }
    cartController.detailQuantity.value = 1;
    getProductVariPrice(
        variation: avaliableVariations[vIndex ?? 0].name ?? "", val: val ?? "");
  }

  bool canAddtoCart({required BuildContext context, required int product_vid}) {
    if (authController.appToken.isEmpty) {
      DialogService.showDialog(
          isDelete: false,
          message: "Please login to continue.",
          dialogType: DialogType.error,
          context: context,
          onContinue: () => Get.toNamed(RouteHelper.login));
      return false;
    } else if (selectedVariationId.value == 0) {
      ToastService.warningToast("Please Select Variant");
      String results = "";
      if (productDetail.value.variations != null) {
        for (var element in productDetail.value.variations!) {
          results += "${element.name!}, ";
        }
      } else {
        ToastService.warningToast("Please select $results");
      }
      return false;
    } else if (productvariation.value.productVariation!.stockQuantity! < 1) {
      ToastService.warningToast("Item is out of stock");
      return false;
    } else {
      return true;
    }
  }


  addFav({required int productId}) async {
    await favController.addFav(productId: productId).then((value) async {
      if (value) {
        isFavorite.value = true;
        await favController.getFavList();
      }
    });
  }

  removeFav({required int productId}) async {
    await favController.removeFav(productId: productId).then((value) async {
      if (value) {
        isFavorite.value = false;
        await favController.getFavList();
      }
    });
  }*/

  RxBool isCommentLoading = false.obs;

  Future<void> comment({required int post_id,required int user_id,required String body,required int parient_id}) async {
    var loading = BotToast.showCustomLoading(
        toastBuilder: (_) => const Center(
          child: CustomLoadingWidget(),
        ));
    isCommentLoading.value=true;
    FocusManager.instance.primaryFocus?.unfocus();

    FormData formData;
    if(isReply.value==false){
      formData = FormData({
        "user_id": user_id.toString(),
        "post_id": post_id.toString(),
        "body": body.toString(),
      });
    }else{
      formData = FormData({
        "user_id": user_id.toString(),
        "body": body.toString(),
        "parent_id": parient_id.toString(),
      });
    }

    try {
      Response response = await productRepo.getComment(id: post_id, data: formData,);
      if (response.statusCode == 200) {
        isCommentLoading.value=false;
        commentController.text="";
        getPostDetail(post_id: post_id);


      } else {
        isCommentLoading.value=false;

        ToastService.errorToast(response.body["message"]);
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
      BotToast.closeAllLoading();
    } finally {
      BotToast.closeAllLoading();
      FocusManager.instance.primaryFocus?.unfocus();

    }
  }

  Rx<PostData> postData = PostData().obs;
  RxBool isPostLoading = false.obs;

  Future<void> getPostDetail({required int post_id}) async {
    isCommentLoading.value=true;

    try {
      final response =
      await productRepo.getPostDetail(id: post_id);
      print(response.body.toString());
      if (response.statusCode == 200) {

        final PostsDetailModel postModel = PostsDetailModel.fromJson(response.body);
         postData.value=postModel.data!;
        for (var i = 0; i < postData.value.comments!.length; i++) {
          if(postData.value.comments![i].id==parent_id.value){
            postData.value.comments![i].replyShow=true;
          }
        }
         isCommentLoading.value=false;
        page_post.value = 1;
        getAllPosts(isLoadmore: false);
        // allProductCanloadMore.value = postModel!;
        change(postData.value, status: RxStatus.success());
      } else {
        isCommentLoading.value=false;

        change(postData.value, status: RxStatus.error(response.bodyString));
      }
    } catch (e) {
      change(postData.value, status: RxStatus.error(e.toString()));
    }
  }

    @override
    void onInit() {
      init();
      super.onInit();
    }

    void init(){
      getAllProducts(isLoadmore: true);
      getAllPosts(isLoadmore: true);
      getBanner();
      getAllBrand();
      getAllCategory();
    }
}