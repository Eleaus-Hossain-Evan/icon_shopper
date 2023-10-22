import 'dart:convert';

import 'package:equatable/equatable.dart';

class SliderModel extends Equatable {
  final int id;
  final String image;
  const SliderModel({
    required this.id,
    required this.image,
  });

  SliderModel copyWith({
    int? id,
    String? image,
  }) {
    return SliderModel(
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
    };
  }

  factory SliderModel.fromMap(Map<String, dynamic> map) {
    return SliderModel(
      id: map['id']?.toInt() ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SliderModel.fromJson(String source) =>
      SliderModel.fromMap(json.decode(source));

  @override
  String toString() => 'SliderModel(id: $id, image: $image)';

  @override
  List<Object> get props => [id, image];
}
