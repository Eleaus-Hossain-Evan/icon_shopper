import 'dart:convert';

import 'package:equatable/equatable.dart';

class BrandModel extends Equatable {
  final int id;
  final String name;
  const BrandModel({
    required this.id,
    required this.name,
  });

  BrandModel copyWith({
    int? id,
    String? name,
  }) {
    return BrandModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandModel.fromJson(String source) =>
      BrandModel.fromMap(json.decode(source));

  @override
  String toString() => 'Brand(id: $id, name: $name)';

  @override
  List<Object> get props => [id, name];
}
