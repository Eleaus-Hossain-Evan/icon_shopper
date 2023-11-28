import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:icon_shopper/features/checkout/domain/promo_data_model.dart';

class CouponResponse extends Equatable {
  final bool success;
  final String message;
  final PromoDataModel data;
  const CouponResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  CouponResponse copyWith({
    bool? success,
    String? message,
    PromoDataModel? data,
  }) {
    return CouponResponse(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data.toMap(),
    };
  }

  factory CouponResponse.fromMap(Map<String, dynamic> map) {
    return CouponResponse(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      data: PromoDataModel.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CouponResponse.fromJson(String source) =>
      CouponResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'CouponResponse(success: $success, message: $message, data: $data)';

  @override
  List<Object> get props => [success, message, data];
}
