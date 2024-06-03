import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../product/domain/model/product_model.dart';

class PaginatedProductResponse extends Equatable {
  final int currentPage;
  final List<ProductModel> data;
  final int total;

  const PaginatedProductResponse({
    required this.currentPage,
    required this.data,
    required this.total,
  });

  factory PaginatedProductResponse.init() {
    return const PaginatedProductResponse(
      currentPage: 0,
      data: [],
      total: 0,
    );
  }

  PaginatedProductResponse copyWith({
    int? currentPage,
    List<ProductModel>? data,
    int? total,
  }) {
    return PaginatedProductResponse(
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_page': currentPage,
      'data': data.map((x) => x.toMap()).toList(),
      'total': total,
    };
  }

  factory PaginatedProductResponse.fromMap(Map<String, dynamic> map) {
    return PaginatedProductResponse(
      currentPage: map['current_page']?.toInt() ?? 0,
      data: List<ProductModel>.from(
          map['data']?.map((x) => ProductModel.fromMap(x)) ?? const []),
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedProductResponse.fromJson(String source) =>
      PaginatedProductResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'NewArrival(current_page: $currentPage, data: $data, total: $total)';

  @override
  List<Object> get props => [currentPage, data, total];
}
