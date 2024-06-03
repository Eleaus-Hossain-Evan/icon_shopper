import 'dart:convert';

import 'package:equatable/equatable.dart';

class Color_list extends Equatable {
  final int id;
  final String name;
  final String code;
  final List<String> color_image_item;
  final List<Current_color_variation> current_color_variations;
  const Color_list({
    required this.id,
    required this.name,
    required this.code,
    required this.color_image_item,
    required this.current_color_variations,
  });

  Color_list copyWith({
    int? id,
    String? name,
    String? code,
    List<String>? color_image_item,
    List<Current_color_variation>? current_color_variations,
  }) {
    return Color_list(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      color_image_item: color_image_item ?? this.color_image_item,
      current_color_variations:
          current_color_variations ?? this.current_color_variations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'color_image_item': color_image_item,
      'current_color_variations':
          current_color_variations.map((x) => x.toMap()).toList(),
    };
  }

  factory Color_list.fromMap(Map<String, dynamic> map) {
    return Color_list(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      color_image_item: List<String>.from(map['color_image_item'] ?? const []),
      current_color_variations: List<Current_color_variation>.from(
          map['current_color_variations']
                  ?.map((x) => Current_color_variation.fromMap(x)) ??
              const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Color_list.fromJson(String source) =>
      Color_list.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Color_list(id: $id, name: $name, code: $code, color_image_item: $color_image_item, current_color_variations: $current_color_variations)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      code,
      color_image_item,
      current_color_variations,
    ];
  }
}

class Current_color_variation extends Equatable {
  final int id;
  final String value;
  final int attribute_id;
  final int color_id;
  const Current_color_variation({
    required this.id,
    required this.value,
    required this.attribute_id,
    required this.color_id,
  });

  Current_color_variation copyWith({
    int? id,
    String? value,
    int? attribute_id,
    int? color_id,
  }) {
    return Current_color_variation(
      id: id ?? this.id,
      value: value ?? this.value,
      attribute_id: attribute_id ?? this.attribute_id,
      color_id: color_id ?? this.color_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
      'attribute_id': attribute_id,
      'color_id': color_id,
    };
  }

  factory Current_color_variation.fromMap(Map<String, dynamic> map) {
    return Current_color_variation(
      id: map['id']?.toInt() ?? 0,
      value: map['value'] ?? '',
      attribute_id: map['attribute_id']?.toInt() ?? 0,
      color_id: map['color_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Current_color_variation.fromJson(String source) =>
      Current_color_variation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Current_color_variation(id: $id, value: $value, attribute_id: $attribute_id, color_id: $color_id)';
  }

  @override
  List<Object> get props => [id, value, attribute_id, color_id];
}
