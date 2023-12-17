// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/order_model.dart';

class OrderListResponse extends Equatable {
  final bool success;
  final List<OrderModel> data;
  const OrderListResponse({
    required this.success,
    required this.data,
  });

  OrderListResponse copyWith({
    bool? success,
    List<OrderModel>? data,
  }) {
    return OrderListResponse(
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

  factory OrderListResponse.fromMap(Map<String, dynamic> map) {
    return OrderListResponse(
      success: map['success'] ?? false,
      data: List<OrderModel>.from(
          map['data']?.map((x) => OrderModel.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderListResponse.fromJson(String source) =>
      OrderListResponse.fromMap(json.decode(source));

  @override
  String toString() => 'OrderListResponse(success: $success, data: $data)';

  @override
  List<Object> get props => [success, data];
}

class Data extends Equatable {
  final int current_page;
  final List<OrderModel> data;
  final int from;
  final int last_page;
  final int per_page;
  final int to;
  final int total;
  const Data({
    required this.current_page,
    required this.data,
    required this.from,
    required this.last_page,
    required this.per_page,
    required this.to,
    required this.total,
  });

  Data copyWith({
    int? current_page,
    List<OrderModel>? data,
    int? from,
    int? last_page,
    int? per_page,
    int? to,
    int? total,
  }) {
    return Data(
      current_page: current_page ?? this.current_page,
      data: data ?? this.data,
      from: from ?? this.from,
      last_page: last_page ?? this.last_page,
      per_page: per_page ?? this.per_page,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_page': current_page,
      'data': data.map((x) => x.toMap()).toList(),
      'from': from,
      'last_page': last_page,
      'per_page': per_page,
      'to': to,
      'total': total,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      current_page: map['current_page']?.toInt() ?? 0,
      data: List<OrderModel>.from(
          map['data']?.map((x) => OrderModel.fromMap(x)) ?? const []),
      from: map['from']?.toInt() ?? 0,
      last_page: map['last_page']?.toInt() ?? 0,
      per_page: map['per_page']?.toInt() ?? 0,
      to: map['to']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(current_page: $current_page, data: $data, from: $from, last_page: $last_page, per_page: $per_page, to: $to, total: $total)';
  }

  @override
  List<Object> get props {
    return [
      current_page,
      data,
      from,
      last_page,
      per_page,
      to,
      total,
    ];
  }
}
