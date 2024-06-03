import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../product/domain/model/product_model.dart';

class CartProductModel extends Equatable {
  final ProductModel product;
  final int quantity;

  const CartProductModel({
    required this.product,
    required this.quantity,
  });

  factory CartProductModel.init() => CartProductModel(
        product: ProductModel.init(),
        quantity: 0,
      );

  CartProductModel copyWith({
    ProductModel? product,
    int? quantity,
  }) {
    return CartProductModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory CartProductModel.fromMap(Map<String, dynamic> map) {
    return CartProductModel(
      product: ProductModel.fromMap(map['product']),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProductModel.fromJson(String source) =>
      CartProductModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CartProductModel(product: $product, quantity: $quantity)';

  @override
  List<Object> get props => [product, quantity];
}
