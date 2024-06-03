// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class CampaignModel extends Equatable {
  final int id;
  final String name;
  final String image;
  final String start_date;
  final String end_date;
  final String discount_type;
  final int discount_amount;
  final String slug;
  const CampaignModel({
    required this.id,
    required this.name,
    required this.image,
    required this.start_date,
    required this.end_date,
    required this.discount_type,
    required this.discount_amount,
    required this.slug,
  });

  CampaignModel copyWith({
    int? id,
    String? name,
    String? image,
    String? start_date,
    String? end_date,
    String? discount_type,
    int? discount_amount,
    String? slug,
  }) {
    return CampaignModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      discount_type: discount_type ?? this.discount_type,
      discount_amount: discount_amount ?? this.discount_amount,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'start_date': start_date,
      'end_date': end_date,
      'discount_type': discount_type,
      'discount_amount': discount_amount,
      'slug': slug,
    };
  }

  factory CampaignModel.fromMap(Map<String, dynamic> map) {
    return CampaignModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      start_date: map['start_date'] ?? '',
      end_date: map['end_date'] ?? '',
      discount_type: map['discount_type'] ?? '',
      discount_amount: map['discount_amount']?.toInt() ?? 0,
      slug: map['slug'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CampaignModel.fromJson(String source) =>
      CampaignModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Campaign(id: $id, name: $name, image: $image, start_date: $start_date, end_date: $end_date, discount_type: $discount_type, discount_amount: $discount_amount, slug: $slug)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      image,
      start_date,
      end_date,
      discount_type,
      discount_amount,
      slug,
    ];
  }
}
