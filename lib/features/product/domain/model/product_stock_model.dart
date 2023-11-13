import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductStockModel extends Equatable {
  final String name;
  final String phone;
  final String address;
  final String product_code;
  final int qty;
  const ProductStockModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.product_code,
    required this.qty,
  });

  ProductStockModel copyWith({
    String? name,
    String? phone,
    String? address,
    String? product_code,
    int? qty,
  }) {
    return ProductStockModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      product_code: product_code ?? this.product_code,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'product_code': product_code,
      'qty': qty,
    };
  }

  factory ProductStockModel.fromMap(Map<String, dynamic> map) {
    return ProductStockModel(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      product_code: map['product_code'] ?? '',
      qty: map['qty']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductStockModel.fromJson(String source) =>
      ProductStockModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Productstockresponse(name: $name, phone: $phone, address: $address, product_code: $product_code, qty: $qty)';
  }

  @override
  List<Object> get props {
    return [
      name,
      phone,
      address,
      product_code,
      qty,
    ];
  }
}
