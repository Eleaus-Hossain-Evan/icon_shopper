import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'product_variant_model.dart';

class ProductModel extends Equatable {
  final int id;
  final int productVariationStatus;
  final String productName;
  final List<int> categoryId;
  final int regularPrice;
  final int discount;
  final String discountType;
  final int salePrice;
  final int wholeSalePrice;
  final List<String> image;
  final int newArrivalStatus;
  final int featuredStatus;
  final int hotProductStatus;
  final String slug;
  final List<ProductVariantModel> productVariants;
  const ProductModel({
    required this.id,
    required this.productVariationStatus,
    required this.productName,
    required this.categoryId,
    required this.regularPrice,
    required this.discount,
    required this.discountType,
    required this.salePrice,
    required this.wholeSalePrice,
    required this.image,
    required this.newArrivalStatus,
    required this.featuredStatus,
    required this.hotProductStatus,
    required this.slug,
    required this.productVariants,
  });

  ProductModel copyWith({
    int? id,
    int? productVariationStatus,
    String? productName,
    List<int>? categoryId,
    int? regularPrice,
    int? discount,
    String? discountType,
    int? salePrice,
    int? wholeSalePrice,
    List<String>? image,
    int? newArrivalStatus,
    int? featuredStatus,
    int? hotProductStatus,
    String? slug,
    List<ProductVariantModel>? productVariants,
  }) {
    return ProductModel(
      id: id ?? this.id,
      productVariationStatus:
          productVariationStatus ?? this.productVariationStatus,
      productName: productName ?? this.productName,
      categoryId: categoryId ?? this.categoryId,
      regularPrice: regularPrice ?? this.regularPrice,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      salePrice: salePrice ?? this.salePrice,
      wholeSalePrice: wholeSalePrice ?? this.wholeSalePrice,
      image: image ?? this.image,
      newArrivalStatus: newArrivalStatus ?? this.newArrivalStatus,
      featuredStatus: featuredStatus ?? this.featuredStatus,
      hotProductStatus: hotProductStatus ?? this.hotProductStatus,
      slug: slug ?? this.slug,
      productVariants: productVariants ?? this.productVariants,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_variation_status': productVariationStatus,
      'product_name': productName,
      'category_id': categoryId,
      'regular_price': regularPrice,
      'discount': discount,
      'discount_type': discountType,
      'sale_price': salePrice,
      'whole_sale_price': wholeSalePrice,
      'image': image,
      'new_arrival_status': newArrivalStatus,
      'featured_status': featuredStatus,
      'hot_product_status': hotProductStatus,
      'slug': slug,
      'product_variants': productVariants.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      productVariationStatus: map['product_variation_status']?.toInt() ?? 0,
      productName: map['product_name'] ?? '',
      categoryId: List<int>.from(map['category_id'] ?? const []),
      regularPrice: map['regular_price']?.toInt() ?? 0,
      discount: map['discount']?.toInt() ?? 0,
      discountType: map['discount_type'] ?? '',
      salePrice: map['sale_price']?.toInt() ?? 0,
      wholeSalePrice: map['whole_sale_price']?.toInt() ?? 0,
      image: List<String>.from(map['image'] ?? const []),
      newArrivalStatus: map['new_arrival_status']?.toInt() ?? 0,
      featuredStatus: map['featured_status']?.toInt() ?? 0,
      hotProductStatus: map['hot_product_status']?.toInt() ?? 0,
      slug: map['slug'] ?? '',
      productVariants: List<ProductVariantModel>.from(
          map['product_variants']?.map((x) => ProductVariantModel.fromMap(x)) ??
              const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, productVariationStatus: $productVariationStatus, productName: $productName, categoryId: $categoryId, regularPrice: $regularPrice, discount: $discount, discountType: $discountType, salePrice: $salePrice, wholeSalePrice: $wholeSalePrice, image: $image, newArrivalStatus: $newArrivalStatus, featuredStatus: $featuredStatus, hotProductStatus: $hotProductStatus, slug: $slug, productVariants: $productVariants)';
  }

  @override
  List<Object> get props {
    return [
      id,
      productVariationStatus,
      productName,
      categoryId,
      regularPrice,
      discount,
      discountType,
      salePrice,
      wholeSalePrice,
      image,
      newArrivalStatus,
      featuredStatus,
      hotProductStatus,
      slug,
      productVariants,
    ];
  }
}
