import 'package:flutter/material.dart';

class NewProduct {
  final int id;
  final String name;
  final String category;
  final int price;
  final String imageUrl;
  final Color color;

  NewProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.color,
  });

  // Convert a NewProduct instance to a Map (JSON)
 
  List<Object?> get props => [id, name, category, price, imageUrl, color];
}
