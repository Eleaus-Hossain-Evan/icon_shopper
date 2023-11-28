import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class PromoDataModel extends Equatable {
  final int id;
  final int? type;
  final String name;
  final int value;
  final int status;
  const PromoDataModel({
    required this.id,
    required this.type,
    required this.name,
    required this.value,
    required this.status,
  });

  factory PromoDataModel.init() => const PromoDataModel(
        id: 0,
        type: 0,
        name: '',
        value: 0,
        status: 0,
      );
  factory PromoDataModel.data() => const PromoDataModel(
        id: 2,
        type: 1,
        name: 'Test Promo',
        value: 10,
        status: 1,
      );

  PromoDataModel copyWith({
    int? id,
    ValueGetter<int?>? type,
    String? name,
    int? value,
    int? status,
  }) {
    return PromoDataModel(
      id: id ?? this.id,
      type: type?.call() ?? this.type,
      name: name ?? this.name,
      value: value ?? this.value,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'value': value,
      'status': status,
    };
  }

  factory PromoDataModel.fromMap(Map<String, dynamic> map) {
    return PromoDataModel(
      id: map['id']?.toInt() ?? 0,
      type: map['type']?.toInt(),
      name: map['name'] ?? '',
      value: map['value']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PromoDataModel.fromJson(String source) =>
      PromoDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PromoDataModel(id: $id, type: $type, name: $name, value: $value, status: $status)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      type,
      name,
      value,
      status,
    ];
  }
}
