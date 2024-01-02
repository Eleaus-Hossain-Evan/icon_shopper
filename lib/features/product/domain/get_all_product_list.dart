// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/product_model.dart';

class GetAllProductResponse extends Equatable {
  final bool success;
  final New_arrival new_arrival;
  const GetAllProductResponse({
    required this.success,
    required this.new_arrival,
  });

  GetAllProductResponse copyWith({
    bool? success,
    New_arrival? new_arrival,
  }) {
    return GetAllProductResponse(
      success: success ?? this.success,
      new_arrival: new_arrival ?? this.new_arrival,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'new_arrival': new_arrival.toMap(),
    };
  }

  factory GetAllProductResponse.fromMap(Map<String, dynamic> map) {
    return GetAllProductResponse(
      success: map['success'] ?? false,
      new_arrival: New_arrival.fromMap(map['new_arrival']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAllProductResponse.fromJson(String source) =>
      GetAllProductResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'GetAllProductResponse(success: $success, new_arrival: $new_arrival)';

  @override
  List<Object> get props => [success, new_arrival];
}

class New_arrival extends Equatable {
  final int current_page;
  final List<ProductModel> data;
  final int total;
  const New_arrival({
    required this.current_page,
    required this.data,
    required this.total,
  });

  New_arrival copyWith({
    int? current_page,
    List<ProductModel>? data,
    int? total,
  }) {
    return New_arrival(
      current_page: current_page ?? this.current_page,
      data: data ?? this.data,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_page': current_page,
      'data': data.map((x) => x.toMap()).toList(),
      'total': total,
    };
  }

  factory New_arrival.fromMap(Map<String, dynamic> map) {
    return New_arrival(
      current_page: map['current_page']?.toInt() ?? 0,
      data: List<ProductModel>.from(
          map['data']?.map((x) => ProductModel.fromMap(x)) ?? const []),
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory New_arrival.fromJson(String source) =>
      New_arrival.fromMap(json.decode(source));

  @override
  String toString() =>
      'New_arrival(current_page: $current_page, data: $data, total: $total)';

  @override
  List<Object> get props => [current_page, data, total];
}
