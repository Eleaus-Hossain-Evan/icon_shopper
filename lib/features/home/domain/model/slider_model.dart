import 'dart:convert';

import 'package:equatable/equatable.dart';

class SliderModel extends Equatable {
  final String image;
  const SliderModel({
    required this.image,
  });

  SliderModel copyWith({
    String? image,
  }) {
    return SliderModel(
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
    };
  }

  factory SliderModel.fromMap(Map<String, dynamic> map) {
    return SliderModel(
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SliderModel.fromJson(String source) =>
      SliderModel.fromMap(json.decode(source));

  @override
  String toString() => 'Slider(image: $image)';

  @override
  List<Object> get props => [image];
}
