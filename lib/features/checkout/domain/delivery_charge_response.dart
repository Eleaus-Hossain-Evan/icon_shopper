import 'dart:convert';

import 'package:equatable/equatable.dart';

class DeliveryChargeResponse extends Equatable {
  final bool success;
  final List<DeliveryChargeModel> data;
  const DeliveryChargeResponse({
    required this.success,
    required this.data,
  });

  DeliveryChargeResponse copyWith({
    bool? success,
    List<DeliveryChargeModel>? data,
  }) {
    return DeliveryChargeResponse(
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

  factory DeliveryChargeResponse.fromMap(Map<String, dynamic> map) {
    return DeliveryChargeResponse(
      success: map['success'] ?? false,
      data: List<DeliveryChargeModel>.from(
          map['data']?.map((x) => DeliveryChargeModel.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryChargeResponse.fromJson(String source) =>
      DeliveryChargeResponse.fromMap(json.decode(source));

  @override
  String toString() => 'DeliveryChargeResponse(success: $success, data: $data)';

  @override
  List<Object> get props => [success, data];
}

class DeliveryChargeModel extends Equatable {
  final int id;
  final String name;
  final int value;
  const DeliveryChargeModel({
    required this.id,
    required this.name,
    required this.value,
  });

  DeliveryChargeModel copyWith({
    int? id,
    String? name,
    int? value,
  }) {
    return DeliveryChargeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'value': value,
    };
  }

  factory DeliveryChargeModel.fromMap(Map<String, dynamic> map) {
    return DeliveryChargeModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      value: map['value']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryChargeModel.fromJson(String source) =>
      DeliveryChargeModel.fromMap(json.decode(source));

  @override
  String toString() => 'Data(id: $id, name: $name, value: $value)';

  @override
  List<Object> get props => [id, name, value];
}
