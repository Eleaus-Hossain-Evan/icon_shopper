import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'brand_model.dart';
import 'color_list.dart';
import 'product_variant_model.dart';

class ProductModel extends Equatable {
  final int id;
  final int productVariationStatus;
  final String productName;
  final String productCode;
  final String variantCode;
  final List<int> categoryId;
  final List<int> brandId;
  final int unitId;
  final int minimumPurchaseQty;
  final String barcodeSymbol;
  final int unitPrice;
  final int discount;
  final String discountType;
  final String shippingType;
  final int qty;
  final String sku;
  final String tags;
  final String refundable;
  final List<String> image;
  final List<String> colors;
  final List<int> attributes;
  final String description;
  final String sizeChart;
  final String guideline;
  final String pdfFile;
  final String metaTag;
  final String metaDescription;
  final String metaImage;
  final String freeShipping;
  final String flatRate;
  final int shippingCost;
  final int lowStockQuantity;
  final int stockVisibilityState;
  final int cashOnDelivery;
  final int newArrivalStatus;
  final int featuredStatus;
  final int hotProductStatus;
  final int landingProduct;
  final String estimateShippingTime;
  final int taxId;
  final int taxMethod;
  final List<int> showroomId;
  final int wholeSellProductStatus;
  final int status;
  final String createdBy;
  final String modifiedBy;
  final String createdAt;
  final String updatedAt;
  final int regularPrice;
  final int salePrice;
  final int wholeSalePrice;
  final List<String> categories;
  final List<BrandModel> brands;
  final List<Color_list> colorList;
  final List<AvailableAttribute> availableAttributes;
  final List<AttributesType> attributesTypes;
  final List<ProductVariantModel> productVariants;
  final String slug;
  const ProductModel({
    required this.id,
    required this.productVariationStatus,
    required this.productName,
    required this.productCode,
    required this.variantCode,
    required this.categoryId,
    required this.brandId,
    required this.unitId,
    required this.minimumPurchaseQty,
    required this.barcodeSymbol,
    required this.unitPrice,
    required this.discount,
    required this.discountType,
    required this.shippingType,
    required this.qty,
    required this.sku,
    required this.tags,
    required this.refundable,
    required this.image,
    required this.colors,
    required this.attributes,
    required this.description,
    required this.sizeChart,
    required this.guideline,
    required this.pdfFile,
    required this.metaTag,
    required this.metaDescription,
    required this.metaImage,
    required this.freeShipping,
    required this.flatRate,
    required this.shippingCost,
    required this.lowStockQuantity,
    required this.stockVisibilityState,
    required this.cashOnDelivery,
    required this.newArrivalStatus,
    required this.featuredStatus,
    required this.hotProductStatus,
    required this.landingProduct,
    required this.estimateShippingTime,
    required this.taxId,
    required this.taxMethod,
    required this.showroomId,
    required this.wholeSellProductStatus,
    required this.status,
    required this.createdBy,
    required this.modifiedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.regularPrice,
    required this.salePrice,
    required this.wholeSalePrice,
    required this.categories,
    required this.brands,
    required this.colorList,
    required this.availableAttributes,
    required this.attributesTypes,
    required this.productVariants,
    required this.slug,
  });

  ProductModel copyWith({
    int? id,
    int? productVariationStatus,
    String? productName,
    String? productCode,
    String? variantCode,
    List<int>? categoryId,
    List<int>? brandId,
    int? unitId,
    int? minimumPurchaseQty,
    String? barcodeSymbol,
    int? unitPrice,
    int? discount,
    String? discountType,
    String? shippingType,
    int? qty,
    String? sku,
    String? tags,
    String? refundable,
    List<String>? image,
    List<String>? colors,
    List<int>? attributes,
    String? description,
    String? sizeChart,
    String? guideline,
    String? pdfFile,
    String? metaTag,
    String? metaDescription,
    String? metaImage,
    String? freeShipping,
    String? flatRate,
    int? shippingCost,
    int? lowStockQuantity,
    int? stockVisibilityState,
    int? cashOnDelivery,
    int? newArrivalStatus,
    int? featuredStatus,
    int? hotProductStatus,
    int? landingProduct,
    String? estimateShippingTime,
    int? taxId,
    int? taxMethod,
    List<int>? showroomId,
    int? wholeSellProductStatus,
    int? status,
    String? createdBy,
    String? modifiedBy,
    String? createdAt,
    String? updatedAt,
    int? regularPrice,
    int? salePrice,
    int? wholeSalePrice,
    List<String>? categories,
    List<BrandModel>? brands,
    List<Color_list>? colorList,
    List<AvailableAttribute>? availableAttributes,
    List<AttributesType>? attributesTypes,
    List<ProductVariantModel>? productVariants,
    String? slug,
  }) {
    return ProductModel(
      id: id ?? this.id,
      productVariationStatus:
          productVariationStatus ?? this.productVariationStatus,
      productName: productName ?? this.productName,
      productCode: productCode ?? this.productCode,
      variantCode: variantCode ?? this.variantCode,
      categoryId: categoryId ?? this.categoryId,
      brandId: brandId ?? this.brandId,
      unitId: unitId ?? this.unitId,
      minimumPurchaseQty: minimumPurchaseQty ?? this.minimumPurchaseQty,
      barcodeSymbol: barcodeSymbol ?? this.barcodeSymbol,
      unitPrice: unitPrice ?? this.unitPrice,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      shippingType: shippingType ?? this.shippingType,
      qty: qty ?? this.qty,
      sku: sku ?? this.sku,
      tags: tags ?? this.tags,
      refundable: refundable ?? this.refundable,
      image: image ?? this.image,
      colors: colors ?? this.colors,
      attributes: attributes ?? this.attributes,
      description: description ?? this.description,
      sizeChart: sizeChart ?? this.sizeChart,
      guideline: guideline ?? this.guideline,
      pdfFile: pdfFile ?? this.pdfFile,
      metaTag: metaTag ?? this.metaTag,
      metaDescription: metaDescription ?? this.metaDescription,
      metaImage: metaImage ?? this.metaImage,
      freeShipping: freeShipping ?? this.freeShipping,
      flatRate: flatRate ?? this.flatRate,
      shippingCost: shippingCost ?? this.shippingCost,
      lowStockQuantity: lowStockQuantity ?? this.lowStockQuantity,
      stockVisibilityState: stockVisibilityState ?? this.stockVisibilityState,
      cashOnDelivery: cashOnDelivery ?? this.cashOnDelivery,
      newArrivalStatus: newArrivalStatus ?? this.newArrivalStatus,
      featuredStatus: featuredStatus ?? this.featuredStatus,
      hotProductStatus: hotProductStatus ?? this.hotProductStatus,
      landingProduct: landingProduct ?? this.landingProduct,
      estimateShippingTime: estimateShippingTime ?? this.estimateShippingTime,
      taxId: taxId ?? this.taxId,
      taxMethod: taxMethod ?? this.taxMethod,
      showroomId: showroomId ?? this.showroomId,
      wholeSellProductStatus:
          wholeSellProductStatus ?? this.wholeSellProductStatus,
      status: status ?? this.status,
      createdBy: createdBy ?? this.createdBy,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      regularPrice: regularPrice ?? this.regularPrice,
      salePrice: salePrice ?? this.salePrice,
      wholeSalePrice: wholeSalePrice ?? this.wholeSalePrice,
      categories: categories ?? this.categories,
      brands: brands ?? this.brands,
      colorList: colorList ?? this.colorList,
      availableAttributes: availableAttributes ?? this.availableAttributes,
      attributesTypes: attributesTypes ?? this.attributesTypes,
      productVariants: productVariants ?? this.productVariants,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_variation_status': productVariationStatus,
      'product_name': productName,
      'product_code': productCode,
      'variant_code': variantCode,
      'category_id': categoryId,
      'brand_id': brandId,
      'unit_id': unitId,
      'minimum_purchase_qty': minimumPurchaseQty,
      'barcode_symbol': barcodeSymbol,
      'unit_price': unitPrice,
      'discount': discount,
      'discount_type': discountType,
      'shipping_type': shippingType,
      'qty': qty,
      'sku': sku,
      'tags': tags,
      'refundable': refundable,
      'image': image,
      'colors': colors,
      'attributes': attributes,
      'description': description,
      'size_chart': sizeChart,
      'guide_line': guideline,
      'pdf_file': pdfFile,
      'meta_tag': metaTag,
      'meta_description': metaDescription,
      'meta_image': metaImage,
      'free_shipping': freeShipping,
      'flat_rate': flatRate,
      'shipping_cost': shippingCost,
      'low_stock_quantity': lowStockQuantity,
      'stock_visibility_state': stockVisibilityState,
      'cash_on_delivery': cashOnDelivery,
      'new_arrival_status': newArrivalStatus,
      'featured_status': featuredStatus,
      'hot_product_status': hotProductStatus,
      'landing_product': landingProduct,
      'estimate_shipping_time': estimateShippingTime,
      'tax_id': taxId,
      'tax_method': taxMethod,
      'showroom_id': showroomId,
      'whole_sell_product_status': wholeSellProductStatus,
      'status': status,
      'created_by': createdBy,
      'modified_by': modifiedBy,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'regular_price': regularPrice,
      'sale_price': salePrice,
      'whole_sale_price': wholeSalePrice,
      'categories': categories,
      'brands': brands.map((x) => x.toMap()).toList(),
      'color_list': colorList.map((x) => x.toMap()).toList(),
      'available_attributes':
          availableAttributes.map((x) => x.toMap()).toList(),
      'attributes_types': attributesTypes.map((x) => x.toMap()).toList(),
      'product_variants': productVariants.map((x) => x.toMap()).toList(),
      'slug': slug,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      productVariationStatus: map['product_variation_status']?.toInt() ?? 0,
      productName: map['product_name'] ?? '',
      productCode: map['product_code'] ?? '',
      variantCode: map['variant_code'] ?? '',
      categoryId: List<int>.from(map['category_id'] ?? const []),
      brandId: List<int>.from(map['brand_id'] ?? const []),
      unitId: map['unit_id']?.toInt() ?? 0,
      minimumPurchaseQty: map['minimum_purchase_qty']?.toInt() ?? 0,
      barcodeSymbol: map['barcode_symbol'] ?? '',
      unitPrice: map['unit_price']?.toInt() ?? 0,
      discount: map['discount']?.toInt() ?? 0,
      discountType: map['discount_type'] ?? '',
      shippingType: map['shipping_type'] ?? '',
      qty: map['qty']?.toInt() ?? 0,
      sku: map['sku'] ?? '',
      tags: map['tags'] ?? '',
      refundable: map['refundable'] ?? '',
      image: List<String>.from(map['image'] ?? const []),
      colors: List<String>.from(map['colors'] ?? const []),
      attributes: List<int>.from(map['attributes'] ?? const []),
      description: map['description'] ?? '',
      sizeChart: map['size_chart'] ?? '',
      guideline: map['guide_line'] ?? '',
      pdfFile: map['pdf_file'] ?? '',
      metaTag: map['meta_tag'] ?? '',
      metaDescription: map['meta_description'] ?? '',
      metaImage: map['meta_image'] ?? '',
      freeShipping: map['free_shipping'] ?? '',
      flatRate: map['flat_rate'] ?? '',
      shippingCost: map['shipping_cost']?.toInt() ?? 0,
      lowStockQuantity: map['low_stock_quantity']?.toInt() ?? 0,
      stockVisibilityState: map['stock_visibility_state']?.toInt() ?? 0,
      cashOnDelivery: map['cash_on_delivery']?.toInt() ?? 0,
      newArrivalStatus: map['new_arrival_status']?.toInt() ?? 0,
      featuredStatus: map['featured_status']?.toInt() ?? 0,
      hotProductStatus: map['hot_product_status']?.toInt() ?? 0,
      landingProduct: map['landing_product']?.toInt() ?? 0,
      estimateShippingTime: map['estimate_shipping_time'] ?? '',
      taxId: map['tax_id']?.toInt() ?? 0,
      taxMethod: map['tax_method']?.toInt() ?? 0,
      showroomId: List<int>.from(map['showroom_id'] ?? const []),
      wholeSellProductStatus: map['whole_sell_product_status']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
      createdBy: map['created_by'] ?? '',
      modifiedBy: map['modified_by'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      regularPrice: map['regular_price']?.toInt() ?? 0,
      salePrice: map['sale_price']?.toInt() ?? 0,
      wholeSalePrice: map['whole_sale_price']?.toInt() ?? 0,
      categories: List<String>.from(map['categories'] ?? const []),
      brands: List<BrandModel>.from(
          map['brands']?.map((x) => BrandModel.fromMap(x)) ?? const []),
      colorList: List<Color_list>.from(
          map['color_list']?.map((x) => Color_list.fromMap(x)) ?? const []),
      availableAttributes: List<AvailableAttribute>.from(
          map['available_attributes']
                  ?.map((x) => AvailableAttribute.fromMap(x)) ??
              const []),
      attributesTypes: List<AttributesType>.from(
          map['attributes_types']?.map((x) => AttributesType.fromMap(x)) ??
              const []),
      productVariants: List<ProductVariantModel>.from(
          map['product_variants']?.map((x) => ProductVariantModel.fromMap(x)) ??
              const []),
      slug: map['slug'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, productVariationStatus: $productVariationStatus, productName: $productName, productCode: $productCode, variantCode: $variantCode, categoryId: $categoryId, brandId: $brandId, unitId: $unitId, minimumPurchaseQty: $minimumPurchaseQty, barcodeSymbol: $barcodeSymbol, unitPrice: $unitPrice, discount: $discount, discountType: $discountType, shippingType: $shippingType, qty: $qty, sku: $sku, tags: $tags, refundable: $refundable, image: $image, colors: $colors, attributes: $attributes, description: $description, sizeChart: $sizeChart, guideline: $guideline, pdfFile: $pdfFile, metaTag: $metaTag, metaDescription: $metaDescription, metaImage: $metaImage, freeShipping: $freeShipping, flatRate: $flatRate, shippingCost: $shippingCost, lowStockQuantity: $lowStockQuantity, stockVisibilityState: $stockVisibilityState, cashOnDelivery: $cashOnDelivery, newArrivalStatus: $newArrivalStatus, featuredStatus: $featuredStatus, hotProductStatus: $hotProductStatus, landingProduct: $landingProduct, estimateShippingTime: $estimateShippingTime, taxId: $taxId, taxMethod: $taxMethod, showroomId: $showroomId, wholeSellProductStatus: $wholeSellProductStatus, status: $status, createdBy: $createdBy, modifiedBy: $modifiedBy, createdAt: $createdAt, updatedAt: $updatedAt, regularPrice: $regularPrice, salePrice: $salePrice, wholeSalePrice: $wholeSalePrice, categories: $categories, brands: $brands, colorList: $colorList, availableAttributes: $availableAttributes, attributesTypes: $attributesTypes, productVariants: $productVariants, slug: $slug)';
  }

  @override
  List<Object> get props {
    return [
      id,
      productVariationStatus,
      productName,
      productCode,
      variantCode,
      categoryId,
      brandId,
      unitId,
      minimumPurchaseQty,
      barcodeSymbol,
      unitPrice,
      discount,
      discountType,
      shippingType,
      qty,
      sku,
      tags,
      refundable,
      image,
      colors,
      attributes,
      description,
      sizeChart,
      guideline,
      pdfFile,
      metaTag,
      metaDescription,
      metaImage,
      freeShipping,
      flatRate,
      shippingCost,
      lowStockQuantity,
      stockVisibilityState,
      cashOnDelivery,
      newArrivalStatus,
      featuredStatus,
      hotProductStatus,
      landingProduct,
      estimateShippingTime,
      taxId,
      taxMethod,
      showroomId,
      wholeSellProductStatus,
      status,
      createdBy,
      modifiedBy,
      createdAt,
      updatedAt,
      regularPrice,
      salePrice,
      wholeSalePrice,
      categories,
      brands,
      colorList,
      availableAttributes,
      attributesTypes,
      productVariants,
      slug,
    ];
  }
}

class AvailableAttribute extends Equatable {
  final int id;
  final String name;
  const AvailableAttribute({
    required this.id,
    required this.name,
  });

  AvailableAttribute copyWith({
    int? id,
    String? name,
  }) {
    return AvailableAttribute(
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

  factory AvailableAttribute.fromMap(Map<String, dynamic> map) {
    return AvailableAttribute(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AvailableAttribute.fromJson(String source) =>
      AvailableAttribute.fromMap(json.decode(source));

  @override
  String toString() => 'Available_attribute(id: $id, name: $name)';

  @override
  List<Object> get props => [id, name];
}

class AttributesType extends Equatable {
  final int id;
  final int product_id;
  final int attribute_id;
  final List<int> attribute_value;
  final String name;
  final List<AppliedAttribute> applied_attributes;
  const AttributesType({
    required this.id,
    required this.product_id,
    required this.attribute_id,
    required this.attribute_value,
    required this.name,
    required this.applied_attributes,
  });

  AttributesType copyWith({
    int? id,
    int? product_id,
    int? attribute_id,
    List<int>? attribute_value,
    String? name,
    List<AppliedAttribute>? applied_attributes,
  }) {
    return AttributesType(
      id: id ?? this.id,
      product_id: product_id ?? this.product_id,
      attribute_id: attribute_id ?? this.attribute_id,
      attribute_value: attribute_value ?? this.attribute_value,
      name: name ?? this.name,
      applied_attributes: applied_attributes ?? this.applied_attributes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': product_id,
      'attribute_id': attribute_id,
      'attribute_value': attribute_value,
      'name': name,
      'applied_attributes': applied_attributes.map((x) => x.toMap()).toList(),
    };
  }

  factory AttributesType.fromMap(Map<String, dynamic> map) {
    return AttributesType(
      id: map['id']?.toInt() ?? 0,
      product_id: map['product_id']?.toInt() ?? 0,
      attribute_id: map['attribute_id']?.toInt() ?? 0,
      attribute_value: List<int>.from(map['attribute_value'] ?? const []),
      name: map['name'] ?? '',
      applied_attributes: List<AppliedAttribute>.from(
          map['applied_attributes']?.map((x) => AppliedAttribute.fromMap(x)) ??
              const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory AttributesType.fromJson(String source) =>
      AttributesType.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Attributes_type(id: $id, product_id: $product_id, attribute_id: $attribute_id, attribute_value: $attribute_value, name: $name, applied_attributes: $applied_attributes)';
  }

  @override
  List<Object> get props {
    return [
      id,
      product_id,
      attribute_id,
      attribute_value,
      name,
      applied_attributes,
    ];
  }
}

class AppliedAttribute extends Equatable {
  final int id;
  final String value;
  const AppliedAttribute({
    required this.id,
    required this.value,
  });

  AppliedAttribute copyWith({
    int? id,
    String? value,
  }) {
    return AppliedAttribute(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
    };
  }

  factory AppliedAttribute.fromMap(Map<String, dynamic> map) {
    return AppliedAttribute(
      id: map['id']?.toInt() ?? 0,
      value: map['value'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppliedAttribute.fromJson(String source) =>
      AppliedAttribute.fromMap(json.decode(source));

  @override
  String toString() => 'Applied_attribute(id: $id, value: $value)';

  @override
  List<Object> get props => [id, value];
}
