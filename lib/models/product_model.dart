class ProductModel {
  bool? success;
  int? total;
  bool? canLoadMore;
  List<ProductData>? data;

  ProductModel({this.success, this.total, this.canLoadMore, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    total = json['total'];
    canLoadMore = json['can_load_more'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['total'] = this.total;
    data['can_load_more'] = this.canLoadMore;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  int? id;
  String? name;
  String? description;
  Brand? brand;
  Brand? category;
  dynamic? price;
  String? status;
  String? image;
  int? stock;
  List<Variations>? variations;
  String? createdAt;

  ProductData(
      {this.id,
        this.name,
        this.description,
        this.brand,
        this.category,
        this.price,
        this.status,
        this.image,
        this.stock,
        this.variations,
        this.createdAt});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    category =
    json['category'] != null ? new Brand.fromJson(json['category']) : null;
    price = json['price'];

    status = json['status'];
    image = json['image'];
    stock = json['stock'];
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['price'] = this.price;

    data['status'] = this.status;
    data['image'] = this.image;
    data['stock'] = this.stock;
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Brand {
  int? id;
  String? name;

  Brand({this.id, this.name});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Variations {
  int? id;
  int? productId;
  int? variationId;
  String? variationName;
  int? variationTypeId;
  String? variationTypeName;
  String? price;
  int? stock;
  String? createdAt;
  String? updatedAt;

  Variations(
      {this.id,
        this.productId,
        this.variationId,
        this.variationName,
        this.variationTypeId,
        this.variationTypeName,
        this.price,
        this.stock,
        this.createdAt,
        this.updatedAt});

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    variationId = json['variation_id'];
    variationName = json['variation_name'];
    variationTypeId = json['variation_type_id'];
    variationTypeName = json['variation_type_name'];
    price = json['price'];
    stock = json['stock'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['variation_id'] = this.variationId;
    data['variation_name'] = this.variationName;
    data['variation_type_id'] = this.variationTypeId;
    data['variation_type_name'] = this.variationTypeName;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}