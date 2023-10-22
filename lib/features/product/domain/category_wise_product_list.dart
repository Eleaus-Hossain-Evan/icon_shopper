import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:icon_shopper/features/product/domain/model/product_model.dart';

class CategoryWiseProductResponse extends Equatable {
  final bool success;
  final Data data;
  final int total;

  const CategoryWiseProductResponse({
    required this.success,
    required this.data,
    required this.total,
  });

  factory CategoryWiseProductResponse.init() {
    return const CategoryWiseProductResponse(
      success: false,
      data: Data(
        current_page: 0,
        data: [],
      ),
      total: 0,
    );
  }

  CategoryWiseProductResponse copyWith({
    bool? success,
    Data? data,
    int? total,
  }) {
    return CategoryWiseProductResponse(
      success: success ?? this.success,
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': data.toMap(),
      'total': total,
    };
  }

  factory CategoryWiseProductResponse.fromMap(Map<String, dynamic> map) {
    return CategoryWiseProductResponse(
      success: map['success'] ?? false,
      data: Data.fromMap(map['data']),
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryWiseProductResponse.fromJson(String source) =>
      CategoryWiseProductResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'CategoryWiseProductResponse(success: $success, data: $data, total: $total)';

  @override
  List<Object> get props => [success, data, total];
}

class Data extends Equatable {
  final int current_page;
  final List<ProductModel> data;
  const Data({
    required this.current_page,
    required this.data,
  });

  Data copyWith({
    int? current_page,
    List<ProductModel>? data,
  }) {
    return Data(
      current_page: current_page ?? this.current_page,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_page': current_page,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      current_page: map['current_page']?.toInt() ?? 0,
      data: List<ProductModel>.from(
          map['data']?.map((x) => ProductModel.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() => 'Data(current_page: $current_page, data: $data)';

  @override
  List<Object> get props => [current_page, data];
}
