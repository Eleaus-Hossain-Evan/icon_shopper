import 'dart:convert';

import 'package:equatable/equatable.dart';

class SubSubCategory extends Equatable {
  final int id;
  final int parentId;
  final int level;
  final String catCode;
  final String slug;
  final String name;
  final String image;
  final int type;
  const SubSubCategory({
    required this.id,
    required this.parentId,
    required this.level,
    required this.catCode,
    required this.slug,
    required this.name,
    required this.image,
    required this.type,
  });

  SubSubCategory copyWith({
    int? id,
    int? parentId,
    int? level,
    String? catCode,
    String? slug,
    String? name,
    String? image,
    int? type,
  }) {
    return SubSubCategory(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      level: level ?? this.level,
      catCode: catCode ?? this.catCode,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      image: image ?? this.image,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parent_id': parentId,
      'level': level,
      'cat_code': catCode,
      'slug': slug,
      'name': name,
      'image': image,
      'type': type,
    };
  }

  factory SubSubCategory.fromMap(Map<String, dynamic> map) {
    return SubSubCategory(
      id: map['id']?.toInt() ?? 0,
      parentId: map['parent_id']?.toInt() ?? 0,
      level: map['level']?.toInt() ?? 0,
      catCode: map['cat_code'] ?? '',
      slug: map['slug'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      type: map['type']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubSubCategory.fromJson(String source) =>
      SubSubCategory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubSubCategory(id: $id, parent_id: $parentId, level: $level, cat_code: $catCode, slug: $slug, name: $name, image: $image, type: $type)';
  }

  @override
  List<Object> get props {
    return [
      id,
      parentId,
      level,
      catCode,
      slug,
      name,
      image,
      type,
    ];
  }
}
