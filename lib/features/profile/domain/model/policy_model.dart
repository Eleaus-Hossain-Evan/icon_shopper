import 'dart:convert';

import 'package:equatable/equatable.dart';

class PolicyModel extends Equatable {
  final int id;
  final String details;
  final String created_at;
  final String updated_at;
  const PolicyModel({
    required this.id,
    required this.details,
    required this.created_at,
    required this.updated_at,
  });

  factory PolicyModel.init()=>PolicyModel(id: 0, details: '', created_at: '', updated_at: '');

  PolicyModel copyWith({
    int? id,
    String? details,
    String? created_at,
    String? updated_at,
  }) {
    return PolicyModel(
      id: id ?? this.id,
      details: details ?? this.details,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'details': details,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory PolicyModel.fromMap(Map<String, dynamic> map) {
    return PolicyModel(
      id: map['id']?.toInt() ?? 0,
      details: map['details'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PolicyModel.fromJson(String source) =>
      PolicyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, details: $details, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  List<Object> get props => [id, details, created_at, updated_at];
}
