import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../product/domain/model/product_model.dart';

class PaginationResponse extends Equatable {
  final int currentPage;
  final List<ProductModel> data;
  final int total;

  const PaginationResponse({
    required this.currentPage,
    required this.data,
    required this.total,
  });

  factory PaginationResponse.init() {
    return const PaginationResponse(
      currentPage: 0,
      data: [],
      total: 0,
    );
  }

  PaginationResponse copyWith({
    int? currentPage,
    List<ProductModel>? data,
    int? total,
  }) {
    return PaginationResponse(
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

  factory PaginationResponse.fromMap(Map<String, dynamic> map) {
    return PaginationResponse(
      currentPage: map['current_page']?.toInt() ?? 0,
      data: List<ProductModel>.from(
          map['data']?.map((x) => ProductModel.fromMap(x)) ?? const []),
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginationResponse.fromJson(String source) =>
      PaginationResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'NewArrival(current_page: $currentPage, data: $data, total: $total)';

  @override
  List<Object> get props => [currentPage, data, total];
}
