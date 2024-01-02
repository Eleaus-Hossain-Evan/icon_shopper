// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class StockProductsModel extends Equatable {
  final int product_id;
  final int total;
  const StockProductsModel({
    required this.product_id,
    required this.total,
  });

  factory StockProductsModel.init() {
    return const StockProductsModel(product_id: 0, total: 0);
  }

  StockProductsModel copyWith({
    int? product_id,
    int? total,
  }) {
    return StockProductsModel(
      product_id: product_id ?? this.product_id,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product_id': product_id,
      'total': total,
    };
  }

  factory StockProductsModel.fromMap(Map<String, dynamic> map) {
    return StockProductsModel(
      product_id: map['product_id']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory StockProductsModel.fromJson(String source) =>
      StockProductsModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'StockProductsModel(product_id: $product_id, total: $total)';

  @override
  List<Object> get props => [product_id, total];
}
