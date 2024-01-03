// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:icon_shopper/features/product/domain/model/product_model.dart';

class CampaignListResponse extends Equatable {
  final String status;
  final List<CampaignProduct> products;
  final List<Campaign_categories> campaign_categories;
  final Pagination pagination;
  const CampaignListResponse({
    required this.status,
    required this.products,
    required this.campaign_categories,
    required this.pagination,
  });

  factory CampaignListResponse.init() => const CampaignListResponse(
      status: '',
      products: [],
      campaign_categories: [],
      pagination: Pagination(
        current_page: 0,
        path: '',
        per_page: 0,
        to: 0,
        total: 0,
      ));

  CampaignListResponse copyWith({
    String? status,
    List<CampaignProduct>? products,
    List<Campaign_categories>? campaign_categories,
    Pagination? pagination,
  }) {
    return CampaignListResponse(
      status: status ?? this.status,
      products: products ?? this.products,
      campaign_categories: campaign_categories ?? this.campaign_categories,
      pagination: pagination ?? this.pagination,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'products': products.map((x) => x.toMap()).toList(),
      'campaign_categories': campaign_categories.map((x) => x.toMap()).toList(),
      'pagination': pagination.toMap(),
    };
  }

  factory CampaignListResponse.fromMap(Map<String, dynamic> map) {
    return CampaignListResponse(
      status: map['status'] ?? '',
      products: List<CampaignProduct>.from(
          map['products']?.map((x) => CampaignProduct.fromMap(x)) ?? const []),
      campaign_categories: List<Campaign_categories>.from(
          map['campaign_categories']
                  ?.map((x) => Campaign_categories.fromMap(x)) ??
              const []),
      pagination: Pagination.fromMap(map['pagination']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CampaignListResponse.fromJson(String source) =>
      CampaignListResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CampaignListResponse(status: $status, products: $products, campaign_categories: $campaign_categories, pagination: $pagination)';
  }

  @override
  List<Object> get props => [status, products, campaign_categories, pagination];
}

class CampaignProduct extends Equatable {
  final int id;
  final int campaign_id;
  final String campaign_name;
  final int product_id;
  final String product_name;
  final String discount_type;
  final int discount_amount;
  final String start_date;
  final String end_date;
  final String status;
  final String created_by;
  final String modified_by;
  final String created_at;
  final String updated_at;
  final ProductModel product;
  const CampaignProduct({
    required this.id,
    required this.campaign_id,
    required this.campaign_name,
    required this.product_id,
    required this.product_name,
    required this.discount_type,
    required this.discount_amount,
    required this.start_date,
    required this.end_date,
    required this.status,
    required this.created_by,
    required this.modified_by,
    required this.created_at,
    required this.updated_at,
    required this.product,
  });

  CampaignProduct copyWith({
    int? id,
    int? campaign_id,
    String? campaign_name,
    int? product_id,
    String? product_name,
    String? discount_type,
    int? discount_amount,
    String? start_date,
    String? end_date,
    String? status,
    String? created_by,
    String? modified_by,
    String? created_at,
    String? updated_at,
    ProductModel? product,
  }) {
    return CampaignProduct(
      id: id ?? this.id,
      campaign_id: campaign_id ?? this.campaign_id,
      campaign_name: campaign_name ?? this.campaign_name,
      product_id: product_id ?? this.product_id,
      product_name: product_name ?? this.product_name,
      discount_type: discount_type ?? this.discount_type,
      discount_amount: discount_amount ?? this.discount_amount,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      status: status ?? this.status,
      created_by: created_by ?? this.created_by,
      modified_by: modified_by ?? this.modified_by,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'campaign_id': campaign_id,
      'campaign_name': campaign_name,
      'product_id': product_id,
      'product_name': product_name,
      'discount_type': discount_type,
      'discount_amount': discount_amount,
      'start_date': start_date,
      'end_date': end_date,
      'status': status,
      'created_by': created_by,
      'modified_by': modified_by,
      'created_at': created_at,
      'updated_at': updated_at,
      'product': product.toMap(),
    };
  }

  factory CampaignProduct.fromMap(Map<String, dynamic> map) {
    return CampaignProduct(
      id: map['id']?.toInt() ?? 0,
      campaign_id: map['campaign_id']?.toInt() ?? 0,
      campaign_name: map['campaign_name'] ?? '',
      product_id: map['product_id']?.toInt() ?? 0,
      product_name: map['product_name'] ?? '',
      discount_type: map['discount_type'] ?? '',
      discount_amount: map['discount_amount']?.toInt() ?? 0,
      start_date: map['start_date'] ?? '',
      end_date: map['end_date'] ?? '',
      status: map['status'] ?? '',
      created_by: map['created_by'] ?? '',
      modified_by: map['modified_by'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      product: ProductModel.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CampaignProduct.fromJson(String source) =>
      CampaignProduct.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CampaignProduct(id: $id, campaign_id: $campaign_id, campaign_name: $campaign_name, product_id: $product_id, product_name: $product_name, discount_type: $discount_type, discount_amount: $discount_amount, start_date: $start_date, end_date: $end_date, status: $status, created_by: $created_by, modified_by: $modified_by, created_at: $created_at, updated_at: $updated_at, product: $product)';
  }

  @override
  List<Object> get props {
    return [
      id,
      campaign_id,
      campaign_name,
      product_id,
      product_name,
      discount_type,
      discount_amount,
      start_date,
      end_date,
      status,
      created_by,
      modified_by,
      created_at,
      updated_at,
      product,
    ];
  }
}

class Campaign_categories extends Equatable {
  final int id;
  final int campaign_id;
  final String campaign_name;
  final int category_id;
  final String category_name;
  final String start_date;
  final String end_date;
  final String discount_type;
  final int discount_amount;
  final String name;
  final String image;
  final String slug;
  const Campaign_categories({
    required this.id,
    required this.campaign_id,
    required this.campaign_name,
    required this.category_id,
    required this.category_name,
    required this.start_date,
    required this.end_date,
    required this.discount_type,
    required this.discount_amount,
    required this.name,
    required this.image,
    required this.slug,
  });

  Campaign_categories copyWith({
    int? id,
    int? campaign_id,
    String? campaign_name,
    int? category_id,
    String? category_name,
    String? start_date,
    String? end_date,
    String? discount_type,
    int? discount_amount,
    String? name,
    String? image,
    String? slug,
  }) {
    return Campaign_categories(
      id: id ?? this.id,
      campaign_id: campaign_id ?? this.campaign_id,
      campaign_name: campaign_name ?? this.campaign_name,
      category_id: category_id ?? this.category_id,
      category_name: category_name ?? this.category_name,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      discount_type: discount_type ?? this.discount_type,
      discount_amount: discount_amount ?? this.discount_amount,
      name: name ?? this.name,
      image: image ?? this.image,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'campaign_id': campaign_id,
      'campaign_name': campaign_name,
      'category_id': category_id,
      'category_name': category_name,
      'start_date': start_date,
      'end_date': end_date,
      'discount_type': discount_type,
      'discount_amount': discount_amount,
      'name': name,
      'image': image,
      'slug': slug,
    };
  }

  factory Campaign_categories.fromMap(Map<String, dynamic> map) {
    return Campaign_categories(
      id: map['id']?.toInt() ?? 0,
      campaign_id: map['campaign_id']?.toInt() ?? 0,
      campaign_name: map['campaign_name'] ?? '',
      category_id: map['category_id']?.toInt() ?? 0,
      category_name: map['category_name'] ?? '',
      start_date: map['start_date'] ?? '',
      end_date: map['end_date'] ?? '',
      discount_type: map['discount_type'] ?? '',
      discount_amount: map['discount_amount']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      slug: map['slug'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Campaign_categories.fromJson(String source) =>
      Campaign_categories.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Campaign_categorie(id: $id, campaign_id: $campaign_id, campaign_name: $campaign_name, category_id: $category_id, category_name: $category_name, start_date: $start_date, end_date: $end_date, discount_type: $discount_type, discount_amount: $discount_amount, name: $name, image: $image, slug: $slug)';
  }

  @override
  List<Object> get props {
    return [
      id,
      campaign_id,
      campaign_name,
      category_id,
      category_name,
      start_date,
      end_date,
      discount_type,
      discount_amount,
      name,
      image,
      slug,
    ];
  }
}

class Pagination extends Equatable {
  final int current_page;
  final String path;
  final int per_page;
  final int to;
  final int total;
  const Pagination({
    required this.current_page,
    required this.path,
    required this.per_page,
    required this.to,
    required this.total,
  });

  Pagination copyWith({
    int? current_page,
    String? path,
    int? per_page,
    int? to,
    int? total,
  }) {
    return Pagination(
      current_page: current_page ?? this.current_page,
      path: path ?? this.path,
      per_page: per_page ?? this.per_page,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_page': current_page,
      'path': path,
      'per_page': per_page,
      'to': to,
      'total': total,
    };
  }

  factory Pagination.fromMap(Map<String, dynamic> map) {
    return Pagination(
      current_page: map['current_page']?.toInt() ?? 0,
      path: map['path'] ?? '',
      per_page: map['per_page']?.toInt() ?? 0,
      to: map['to']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pagination.fromJson(String source) =>
      Pagination.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pagination(current_page: $current_page, path: $path, per_page: $per_page, to: $to, total: $total)';
  }

  @override
  List<Object> get props {
    return [
      current_page,
      path,
      per_page,
      to,
      total,
    ];
  }
}
