

import 'package:top_star/models/product_model.dart';

class CartModel {
  int? productId;
  int? productVarientId;
  int? quantity;
  dynamic? name;
  Variations? variation;
  dynamic? price;
  dynamic? image;
  dynamic? totalPrice;

  CartModel(
      { this.productId,
         this.productVarientId,
         this.quantity,
          this.name,
        this.variation,
          this.price,
          this.image,
          this.totalPrice});

  CartModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productVarientId = json['product_variation_id'];
    quantity = json['quantity'];
    name = json['name'];
    variation = json['variation'] != null ? new Variations.fromJson(json['variation']) : null;
    price = json['price'];
    image = json['image'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_variation_id'] = this.productVarientId;
    data['quantity'] = this.quantity;
    data['name'] = this.name;
    if (this.variation != null) {
      data['variation'] = this.variation!.toJson();
    }
    data['price'] = this.price;
    data['image'] = this.image;
    data['total_price'] = this.totalPrice;
    return data;
  }
}