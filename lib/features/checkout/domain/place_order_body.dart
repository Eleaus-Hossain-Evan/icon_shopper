// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class PlaceOrderBody extends Equatable {
  final String invoice_no;
  final int customer_id;
  final int item;
  final int total_qty;
  final double shipping_cost;
  final double net_total;
  final double grand_total;
  final String sale_date;
  final int? coupon_id;
  final int? coupon_type;
  final num? coupon_discount;
  final num? coupon_rate;
  final String name;
  final String phone;
  final String information;
  final List<SProduct> s_product;
  const PlaceOrderBody({
    required this.invoice_no,
    required this.customer_id,
    required this.item,
    required this.total_qty,
    required this.shipping_cost,
    required this.net_total,
    required this.grand_total,
    required this.sale_date,
    required this.coupon_id,
    this.coupon_type,
    this.coupon_discount,
    this.coupon_rate,
    required this.name,
    required this.phone,
    required this.information,
    required this.s_product,
  });

  PlaceOrderBody copyWith({
    String? invoice_no,
    int? customer_id,
    int? item,
    int? total_qty,
    double? shipping_cost,
    double? net_total,
    double? grand_total,
    String? sale_date,
    ValueGetter<int?>? coupon_id,
    ValueGetter<int?>? coupon_type,
    ValueGetter<num?>? coupon_discount,
    ValueGetter<num?>? coupon_rate,
    String? name,
    String? phone,
    String? information,
    List<SProduct>? s_product,
  }) {
    return PlaceOrderBody(
      invoice_no: invoice_no ?? this.invoice_no,
      customer_id: customer_id ?? this.customer_id,
      item: item ?? this.item,
      total_qty: total_qty ?? this.total_qty,
      shipping_cost: shipping_cost ?? this.shipping_cost,
      net_total: net_total ?? this.net_total,
      grand_total: grand_total ?? this.grand_total,
      sale_date: sale_date ?? this.sale_date,
      coupon_id: coupon_id?.call() ?? this.coupon_id,
      coupon_type: coupon_type?.call() ?? this.coupon_type,
      coupon_discount: coupon_discount?.call() ?? this.coupon_discount,
      coupon_rate: coupon_rate?.call() ?? this.coupon_rate,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      information: information ?? this.information,
      s_product: s_product ?? this.s_product,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'invoice_no': invoice_no,
      'customer_id': customer_id,
      'item': item,
      'total_qty': total_qty,
      'shipping_cost': shipping_cost,
      'net_total': net_total,
      'grand_total': grand_total,
      'sale_date': sale_date,
      'coupon_id': coupon_id,
      'coupon_type': coupon_type,
      'coupon_discount': coupon_discount,
      'coupon_rate': coupon_rate,
      'name': name,
      'phone': phone,
      'information': information,
      's_product': s_product.map((x) => x.toMap()).toList(),
    };
  }

  factory PlaceOrderBody.fromMap(Map<String, dynamic> map) {
    return PlaceOrderBody(
      invoice_no: map['invoice_no'] ?? '',
      customer_id: map['customer_id']?.toInt() ?? 0,
      item: map['item']?.toInt() ?? 0,
      total_qty: map['total_qty']?.toInt() ?? 0,
      shipping_cost: map['shipping_cost']?.toDouble() ?? 0.0,
      net_total: map['net_total']?.toDouble() ?? 0.0,
      grand_total: map['grand_total']?.toDouble() ?? 0.0,
      sale_date: map['sale_date'] ?? '',
      coupon_id: map['coupon_id']?.toInt(),
      coupon_type: map['coupon_type']?.toInt(),
      coupon_discount: map['coupon_discount'],
      coupon_rate: map['coupon_rate'],
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      information: map['information'] ?? '',
      s_product: List<SProduct>.from(
          map['s_product']?.map((x) => SProduct.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceOrderBody.fromJson(String source) =>
      PlaceOrderBody.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlaceOrderBody(invoice_no: $invoice_no, customer_id: $customer_id, item: $item, total_qty: $total_qty, shipping_cost: $shipping_cost, net_total: $net_total, grand_total: $grand_total, sale_date: $sale_date, coupon_id: $coupon_id, coupon_type: $coupon_type, coupon_discount: $coupon_discount, coupon_rate: $coupon_rate, name: $name, phone: $phone, information: $information, s_product: $s_product)';
  }

  @override
  List<Object?> get props {
    return [
      invoice_no,
      customer_id,
      item,
      total_qty,
      shipping_cost,
      net_total,
      grand_total,
      sale_date,
      coupon_id,
      coupon_type,
      coupon_discount,
      coupon_rate,
      name,
      phone,
      information,
      s_product,
    ];
  }
}

class SProduct extends Equatable {
  final int variant_id;
  final int product_id;
  final int qty;
  final int sale_unit_id;
  final int net_unit_price;
  final int regular_price;
  final int discount_type;
  final int discount;
  final num discount_rate;
  final int total;
  const SProduct({
    required this.variant_id,
    required this.product_id,
    required this.qty,
    required this.sale_unit_id,
    required this.net_unit_price,
    required this.regular_price,
    required this.discount_type,
    required this.discount,
    required this.discount_rate,
    required this.total,
  });

  SProduct copyWith({
    int? variant_id,
    int? product_id,
    int? qty,
    int? sale_unit_id,
    int? net_unit_price,
    int? regular_price,
    int? discount_type,
    int? discount,
    num? discount_rate,
    int? total,
  }) {
    return SProduct(
      variant_id: variant_id ?? this.variant_id,
      product_id: product_id ?? this.product_id,
      qty: qty ?? this.qty,
      sale_unit_id: sale_unit_id ?? this.sale_unit_id,
      net_unit_price: net_unit_price ?? this.net_unit_price,
      regular_price: regular_price ?? this.regular_price,
      discount_type: discount_type ?? this.discount_type,
      discount: discount ?? this.discount,
      discount_rate: discount_rate ?? this.discount_rate,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'variant_id': variant_id,
      'product_id': product_id,
      'qty': qty,
      'sale_unit_id': sale_unit_id,
      'net_unit_price': net_unit_price,
      'regular_price': regular_price,
      'discount_type': discount_type,
      'discount': discount,
      'discount_rate': discount_rate,
      'total': total,
    };
  }

  factory SProduct.fromMap(Map<String, dynamic> map) {
    return SProduct(
      variant_id: map['variant_id']?.toInt() ?? 0,
      product_id: map['product_id']?.toInt() ?? 0,
      qty: map['qty']?.toInt() ?? 0,
      sale_unit_id: map['sale_unit_id']?.toInt() ?? 0,
      net_unit_price: map['net_unit_price']?.toInt() ?? 0,
      regular_price: map['regular_price']?.toInt() ?? 0,
      discount_type: map['discount_type']?.toInt() ?? 0,
      discount: map['discount']?.toInt() ?? 0,
      discount_rate: map['discount_rate'] ?? 0,
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SProduct.fromJson(String source) =>
      SProduct.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SProduct(variant_id: $variant_id, product_id: $product_id, qty: $qty, sale_unit_id: $sale_unit_id, net_unit_price: $net_unit_price, regular_price: $regular_price, discount_type: $discount_type, discount: $discount, discount_rate: $discount_rate, total: $total)';
  }

  @override
  List<Object> get props {
    return [
      variant_id,
      product_id,
      qty,
      sale_unit_id,
      net_unit_price,
      regular_price,
      discount_type,
      discount,
      discount_rate,
      total,
    ];
  }
}
