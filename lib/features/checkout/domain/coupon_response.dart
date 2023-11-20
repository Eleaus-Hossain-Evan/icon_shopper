import 'dart:convert';

import 'package:equatable/equatable.dart';

class CouponResponse extends Equatable {
  final bool success;
  final String message;
  final String data;
  const CouponResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  CouponResponse copyWith({
    bool? success,
    String? message,
    String? data,
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
      'data': data,
    };
  }

  factory CouponResponse.fromMap(Map<String, dynamic> map) {
    return CouponResponse(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      data: map['data'] ?? '',
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
