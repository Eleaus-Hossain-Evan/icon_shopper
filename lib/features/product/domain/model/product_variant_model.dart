import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductVariantModel extends Equatable {
  final int id;
  final int productId;
  final String productCode;
  final String productVariantName;
  final int regularPrice;
  final int discount;
  final String discountType;
  final int salePrice;
  final int wholeSalePrice;
  final int qty;
  final List<String> variantId;
  final String attributeId;
  final int colorId;
  final List<AttributesWithoutColor> attributesWithoutColor;
  final List<ColorModel> color;
  const ProductVariantModel({
    required this.id,
    required this.productId,
    required this.productCode,
    required this.productVariantName,
    required this.regularPrice,
    required this.discount,
    required this.discountType,
    required this.salePrice,
    required this.wholeSalePrice,
    required this.qty,
    required this.variantId,
    required this.attributeId,
    required this.colorId,
    required this.attributesWithoutColor,
    required this.color,
  });

  ProductVariantModel copyWith({
    int? id,
    int? productId,
    String? productCode,
    String? productVariantName,
    int? regularPrice,
    int? discount,
    String? discountType,
    int? salePrice,
    int? wholeSalePrice,
    int? qty,
    List<String>? variantId,
    String? attributeId,
    int? colorId,
    List<AttributesWithoutColor>? attributesWithoutColor,
    List<ColorModel>? color,
  }) {
    return ProductVariantModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productCode: productCode ?? this.productCode,
      productVariantName: productVariantName ?? this.productVariantName,
      regularPrice: regularPrice ?? this.regularPrice,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      salePrice: salePrice ?? this.salePrice,
      wholeSalePrice: wholeSalePrice ?? this.wholeSalePrice,
      qty: qty ?? this.qty,
      variantId: variantId ?? this.variantId,
      attributeId: attributeId ?? this.attributeId,
      colorId: colorId ?? this.colorId,
      attributesWithoutColor:
          attributesWithoutColor ?? this.attributesWithoutColor,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productCode': productCode,
      'productVariantName': productVariantName,
      'regularPrice': regularPrice,
      'discount': discount,
      'discountType': discountType,
      'salePrice': salePrice,
      'wholeSalePrice': wholeSalePrice,
      'qty': qty,
      'variantId': variantId,
      'attributeId': attributeId,
      'colorId': colorId,
      'attributesWithoutColor':
          attributesWithoutColor.map((x) => x.toMap()).toList(),
      'color': color.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductVariantModel.fromMap(Map<String, dynamic> map) {
    return ProductVariantModel(
      id: map['id']?.toInt() ?? 0,
      productId: map['product_id']?.toInt() ?? 0,
      productCode: map['product_code'] ?? '',
      productVariantName: map['product_variant_name'] ?? '',
      regularPrice: map['regular_price']?.toInt() ?? 0,
      discount: map['discount']?.toInt() ?? 0,
      discountType: map['discount_type'] ?? '',
      salePrice: map['sale_price']?.toInt() ?? 0,
      wholeSalePrice: map['whole_sale_price']?.toInt() ?? 0,
      qty: map['qty']?.toInt() ?? 0,
      variantId: List<String>.from(map['variant_id'] ?? const []),
      attributeId: map['attribute_id'] ?? '',
      colorId: map['color_id']?.toInt() ?? 0,
      attributesWithoutColor: List<AttributesWithoutColor>.from(
          map['attributes_without_color']
                  ?.map((x) => AttributesWithoutColor.fromMap(x)) ??
              const []),
      color: List<ColorModel>.from(
          map['color']?.map((x) => ColorModel.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductVariantModel.fromJson(String source) =>
      ProductVariantModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductVariantModel(id: $id, productId: $productId, productCode: $productCode, productVariantName: $productVariantName, regularPrice: $regularPrice, discount: $discount, discountType: $discountType, salePrice: $salePrice, wholeSalePrice: $wholeSalePrice, qty: $qty, variantId: $variantId, attributeId: $attributeId, colorId: $colorId, attributesWithoutColor: $attributesWithoutColor, color: $color)';
  }

  @override
  List<Object> get props {
    return [
      id,
      productId,
      productCode,
      productVariantName,
      regularPrice,
      discount,
      discountType,
      salePrice,
      wholeSalePrice,
      qty,
      variantId,
      attributeId,
      colorId,
      attributesWithoutColor,
      color,
    ];
  }
}

class AttributesWithoutColor extends Equatable {
  final int id;
  final String value;
  final int attributeId;
  const AttributesWithoutColor({
    required this.id,
    required this.value,
    required this.attributeId,
  });

  AttributesWithoutColor copyWith({
    int? id,
    String? value,
    int? attributeId,
  }) {
    return AttributesWithoutColor(
      id: id ?? this.id,
      value: value ?? this.value,
      attributeId: attributeId ?? this.attributeId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
      'attribute_id': attributeId,
    };
  }

  factory AttributesWithoutColor.fromMap(Map<String, dynamic> map) {
    return AttributesWithoutColor(
      id: map['id']?.toInt() ?? 0,
      value: map['value'] ?? '',
      attributeId: map['attribute_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttributesWithoutColor.fromJson(String source) =>
      AttributesWithoutColor.fromMap(json.decode(source));

  @override
  String toString() =>
      'Attributes_without_color(id: $id, value: $value, attribute_id: $attributeId)';

  @override
  List<Object> get props => [id, value, attributeId];
}

class ColorModel extends Equatable {
  final int id;
  final String name;
  final String code;
  const ColorModel({
    required this.id,
    required this.name,
    required this.code,
  });

  ColorModel copyWith({
    int? id,
    String? name,
    String? code,
  }) {
    return ColorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
    };
  }

  factory ColorModel.fromMap(Map<String, dynamic> map) {
    return ColorModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      code: map['code'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ColorModel.fromJson(String source) =>
      ColorModel.fromMap(json.decode(source));

  @override
  String toString() => 'Color(id: $id, name: $name, code: $code)';

  @override
  List<Object> get props => [id, name, code];
}
