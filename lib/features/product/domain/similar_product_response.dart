import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:icon_shopper/features/product/domain/model/product_model.dart';

class SimilarProductResponse extends Equatable {
  final bool success;
  final List<ProductModel> data;

  const SimilarProductResponse({
    required this.success,
    required this.data,
  });

  SimilarProductResponse copyWith({
    bool? success,
    List<ProductModel>? data,
  }) {
    return SimilarProductResponse(
      success: success ?? this.success,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory SimilarProductResponse.fromMap(Map<String, dynamic> map) {
    return SimilarProductResponse(
      success: map['success'] ?? false,
      data: List<ProductModel>.from(
          map['data']?.map((x) => ProductModel.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory SimilarProductResponse.fromJson(String source) =>
      SimilarProductResponse.fromMap(json.decode(source));

  @override
  String toString() => 'SimilarProductResponse(success: $success, data: $data)';

  @override
  List<Object> get props => [success, data];
}
