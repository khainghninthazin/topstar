class DetailModel {
  String? productId;
  String? productVariationId;
  String? quantity;
  String? image;
  String? name;
  String? description;
  
  String? color;
  String? price;
  String? totalPrice;

  DetailModel(
      {this.productId,
        this.productVariationId,
        this.quantity,
        this.image,
        this.name,
        this.description,
        this.color,
        this.price,
        this.totalPrice});

  DetailModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productVariationId = json['product_variation_id'];
    quantity = json['quantity'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    color = json['color'];
    price = json['price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_variation_id'] = this.productVariationId;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['color'] = this.color;
    data['price'] = this.price;
    data['total_price'] = this.totalPrice;
    return data;
  }
}