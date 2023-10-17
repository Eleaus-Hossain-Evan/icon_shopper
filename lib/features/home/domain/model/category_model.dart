
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'sub_category_model.dart';

class CategoryModel extends Equatable {
  final int id;
  final String slug;
  final String name;
  final String image;
  final int type;
  final List<SubCategoryModel> subCategories;
  const CategoryModel({
    required this.id,
    required this.slug,
    required this.name,
    required this.image,
    required this.type,
    required this.subCategories,
  });

  CategoryModel copyWith({
    int? id,
    String? slug,
    String? name,
    String? image,
    int? type,
    List<SubCategoryModel>? subCategories,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      image: image ?? this.image,
      type: type ?? this.type,
      subCategories: subCategories ?? this.subCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'slug': slug,
      'name': name,
      'image': image,
      'type': type,
      'sub_categories': subCategories.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id']?.toInt() ?? 0,
      slug: map['slug'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      type: map['type']?.toInt() ?? 0,
      subCategories: List<SubCategoryModel>.from(
          map['sub_categories']?.map((x) => SubCategoryModel.fromMap(x)) ??
              const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, slug: $slug, name: $name, image: $image, type: $type, sub_categories: $subCategories)';
  }

  @override
  List<Object> get props {
    return [
      id,
      slug,
      name,
      image,
      type,
      subCategories,
    ];
  }
}
