import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/product_model.dart';

class NewArrivalResponse extends Equatable {
  final int currentPage;
  final List<ProductModel> data;
  final int total;
  const NewArrivalResponse({
    required this.currentPage,
    required this.data,
    required this.total,
  });

  NewArrivalResponse copyWith({
    int? currentPage,
    List<ProductModel>? data,
    int? total,
  }) {
    return NewArrivalResponse(
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

  factory NewArrivalResponse.fromMap(Map<String, dynamic> map) {
    return NewArrivalResponse(
      currentPage: map['current_page']?.toInt() ?? 0,
      data: List<ProductModel>.from(
          map['data']?.map((x) => ProductModel.fromMap(x)) ?? const []),
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewArrivalResponse.fromJson(String source) =>
      NewArrivalResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'NewArrival(current_page: $currentPage, data: $data, total: $total)';

  @override
  List<Object> get props => [currentPage, data, total];
}
