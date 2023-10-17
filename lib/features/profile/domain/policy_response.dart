import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/policy_model.dart';

class PolicyResponse extends Equatable {
  final bool success;
  final PolicyModel data;
  const PolicyResponse({
    required this.success,
    required this.data,
  });

  PolicyResponse copyWith({
    bool? success,
    PolicyModel? data,
  }) {
    return PolicyResponse(
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

  factory PolicyResponse.fromMap(Map<String, dynamic> map) {
    return PolicyResponse(
      success: map['success'] ?? false,
      data: PolicyModel.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PolicyResponse.fromJson(String source) =>
      PolicyResponse.fromMap(json.decode(source));

  @override
  String toString() => 'PolicyResponse(success: $success, data: $data)';

  @override
  List<Object> get props => [success, data];
}
