import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'sub_sub_category_model.dart';

class SubCategory extends Equatable {
  final int id;
  final int parentId;
  final int level;
  final String catCode;
  final String slug;
  final String name;
  final String image;
  final int type;
  final List<SubSubCategory> subSubCategory;
  const SubCategory({
    required this.id,
    required this.parentId,
    required this.level,
    required this.catCode,
    required this.slug,
    required this.name,
    required this.image,
    required this.type,
    required this.subSubCategory,
  });

  SubCategory copyWith({
    int? id,
    int? parentId,
    int? level,
    String? catCode,
    String? slug,
    String? name,
    String? image,
    int? type,
    List<SubSubCategory>? subSubCategory,
  }) {
    return SubCategory(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      level: level ?? this.level,
      catCode: catCode ?? this.catCode,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      image: image ?? this.image,
      type: type ?? this.type,
      subSubCategory: subSubCategory ?? this.subSubCategory,
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
      'subsubcategory': subSubCategory.map((x) => x.toMap()).toList(),
    };
  }

  factory SubCategory.fromMap(Map<String, dynamic> map) {
    return SubCategory(
      id: map['id']?.toInt() ?? 0,
      parentId: map['parent_id']?.toInt() ?? 0,
      level: map['level']?.toInt() ?? 0,
      catCode: map['cat_code'] ?? '',
      slug: map['slug'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      type: map['type']?.toInt() ?? 0,
      subSubCategory: List<SubSubCategory>.from(
          map['subsubcategory']?.map((x) => SubSubCategory.fromMap(x)) ??
              const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategory.fromJson(String source) =>
      SubCategory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubCategory(id: $id, parent_id: $parentId, level: $level, cat_code: $catCode, slug: $slug, name: $name, image: $image, type: $type, subsubcategory: $subSubCategory)';
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
      subSubCategory,
    ];
  }
}
