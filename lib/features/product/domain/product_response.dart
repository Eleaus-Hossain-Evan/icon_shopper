import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/product_model.dart';

class ProductResponse extends Equatable {
  final bool success;
  final ProductModel data;

  const ProductResponse({
    required this.success,
    required this.data,
  });

  factory ProductResponse.init() {
    return ProductResponse(
      success: false,
      data: ProductModel.init(),
    );
  }

  ProductResponse copyWith({
    bool? success,
    ProductModel? data,
  }) {
    return ProductResponse(
      success: success ?? this.success,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': data.toMap(),
    };
  }

  factory ProductResponse.fromMap(Map<String, dynamic> map) {
    return ProductResponse(
      success: map['success'] ?? false,
      data: ProductModel.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductResponse.fromJson(String source) =>
      ProductResponse.fromMap(json.decode(source));

  @override
  String toString() => 'ProductResponse(success: $success, data: $data)';

  @override
  List<Object> get props => [success, data];
}
