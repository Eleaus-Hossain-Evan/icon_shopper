// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final int id;
  final String invoice_no;
  final String name;
  final String phone;
  final int item;
  final int total_qty;
  final int net_total;
  final double total_discount;
  final int shipping_cost;
  final double order_discount;
  final double order_tax;
  final int grand_total;
  final String payment_method;
  final String sale_date;
  final int delivery_status;
  final String information;
  final String optional_information;
  final List<SaleProductList> sale_product_list;
  const OrderModel({
    required this.id,
    required this.invoice_no,
    required this.name,
    required this.phone,
    required this.item,
    required this.total_qty,
    required this.net_total,
    required this.total_discount,
    required this.shipping_cost,
    required this.order_discount,
    required this.order_tax,
    required this.grand_total,
    required this.payment_method,
    required this.sale_date,
    required this.delivery_status,
    required this.information,
    required this.optional_information,
    required this.sale_product_list,
  });

  OrderModel copyWith({
    int? id,
    String? invoice_no,
    String? name,
    String? phone,
    int? item,
    int? total_qty,
    int? net_total,
    double? total_discount,
    int? shipping_cost,
    double? order_discount,
    double? order_tax,
    int? grand_total,
    String? payment_method,
    String? sale_date,
    int? delivery_status,
    String? information,
    String? optional_information,
    List<SaleProductList>? sale_product_list,
  }) {
    return OrderModel(
      id: id ?? this.id,
      invoice_no: invoice_no ?? this.invoice_no,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      item: item ?? this.item,
      total_qty: total_qty ?? this.total_qty,
      net_total: net_total ?? this.net_total,
      total_discount: total_discount ?? this.total_discount,
      shipping_cost: shipping_cost ?? this.shipping_cost,
      order_discount: order_discount ?? this.order_discount,
      order_tax: order_tax ?? this.order_tax,
      grand_total: grand_total ?? this.grand_total,
      payment_method: payment_method ?? this.payment_method,
      sale_date: sale_date ?? this.sale_date,
      delivery_status: delivery_status ?? this.delivery_status,
      information: information ?? this.information,
      optional_information: optional_information ?? this.optional_information,
      sale_product_list: sale_product_list ?? this.sale_product_list,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'invoice_no': invoice_no,
      'name': name,
      'phone': phone,
      'item': item,
      'total_qty': total_qty,
      'net_total': net_total,
      'total_discount': total_discount,
      'shipping_cost': shipping_cost,
      'order_discount': order_discount,
      'order_tax': order_tax,
      'grand_total': grand_total,
      'payment_method': payment_method,
      'sale_date': sale_date,
      'delivery_status': delivery_status,
      'information': information,
      'optional_information': optional_information,
      'sale_product_list': sale_product_list.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id']?.toInt() ?? 0,
      invoice_no: map['invoice_no'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      item: map['item']?.toInt() ?? 0,
      total_qty: map['total_qty']?.toInt() ?? 0,
      net_total: map['net_total']?.toInt() ?? 0,
      total_discount: map['total_discount']?.toDouble() ?? 0.0,
      shipping_cost: map['shipping_cost']?.toInt() ?? 0,
      order_discount: map['order_discount']?.toDouble() ?? 0.0,
      order_tax: map['order_tax']?.toDouble() ?? 0.0,
      grand_total: map['grand_total']?.toInt() ?? 0,
      payment_method: map['payment_method'] ?? '',
      sale_date: map['sale_date'] ?? '',
      delivery_status: int.tryParse(map['delivery_status']) ?? 0,
      information: map['information'] ?? '',
      optional_information: map['optional_information'] ?? '',
      sale_product_list: List<SaleProductList>.from(
          map['sale_product_list']?.map((x) => SaleProductList.fromMap(x)) ??
              const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(id: $id, invoice_no: $invoice_no, name: $name, phone: $phone, item: $item, total_qty: $total_qty, net_total: $net_total, total_discount: $total_discount, shipping_cost: $shipping_cost, order_discount: $order_discount, order_tax: $order_tax, grand_total: $grand_total, payment_method: $payment_method, sale_date: $sale_date, delivery_status: $delivery_status, information: $information, optional_information: $optional_information, sale_product_list: $sale_product_list)';
  }

  @override
  List<Object> get props {
    return [
      id,
      invoice_no,
      name,
      phone,
      item,
      total_qty,
      net_total,
      total_discount,
      shipping_cost,
      order_discount,
      order_tax,
      grand_total,
      payment_method,
      sale_date,
      delivery_status,
      information,
      optional_information,
      sale_product_list,
    ];
  }
}

class SaleProductList extends Equatable {
  final int sale_id;
  final int product_id;
  final int qty;
  final int sale_unit_id;
  final int net_unit_price;
  final int total;
  final Unit unit;
  final Product product;
  const SaleProductList({
    required this.sale_id,
    required this.product_id,
    required this.qty,
    required this.sale_unit_id,
    required this.net_unit_price,
    required this.total,
    required this.unit,
    required this.product,
  });

  SaleProductList copyWith({
    int? sale_id,
    int? product_id,
    int? qty,
    int? sale_unit_id,
    int? net_unit_price,
    int? total,
    Unit? unit,
    Product? product,
  }) {
    return SaleProductList(
      sale_id: sale_id ?? this.sale_id,
      product_id: product_id ?? this.product_id,
      qty: qty ?? this.qty,
      sale_unit_id: sale_unit_id ?? this.sale_unit_id,
      net_unit_price: net_unit_price ?? this.net_unit_price,
      total: total ?? this.total,
      unit: unit ?? this.unit,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sale_id': sale_id,
      'product_id': product_id,
      'qty': qty,
      'sale_unit_id': sale_unit_id,
      'net_unit_price': net_unit_price,
      'total': total,
      'unit': unit.toMap(),
      'product': product.toMap(),
    };
  }

  factory SaleProductList.fromMap(Map<String, dynamic> map) {
    return SaleProductList(
      sale_id: map['sale_id']?.toInt() ?? 0,
      product_id: map['product_id']?.toInt() ?? 0,
      qty: map['qty']?.toInt() ?? 0,
      sale_unit_id: map['sale_unit_id']?.toInt() ?? 0,
      net_unit_price: map['net_unit_price']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
      unit: Unit.fromMap(map['unit']),
      product: Product.fromMap(map['product']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleProductList.fromJson(String source) =>
      SaleProductList.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Sale_product_list(sale_id: $sale_id, product_id: $product_id, qty: $qty, sale_unit_id: $sale_unit_id, net_unit_price: $net_unit_price, total: $total, unit: $unit, product: $product)';
  }

  @override
  List<Object> get props {
    return [
      sale_id,
      product_id,
      qty,
      sale_unit_id,
      net_unit_price,
      total,
      unit,
      product,
    ];
  }
}

class Unit extends Equatable {
  final int id;
  final String unit_name;
  const Unit({
    required this.id,
    required this.unit_name,
  });

  Unit copyWith({
    int? id,
    String? unit_name,
  }) {
    return Unit(
      id: id ?? this.id,
      unit_name: unit_name ?? this.unit_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'unit_name': unit_name,
    };
  }

  factory Unit.fromMap(Map<String, dynamic> map) {
    return Unit(
      id: map['id']?.toInt() ?? 0,
      unit_name: map['unit_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Unit.fromJson(String source) => Unit.fromMap(json.decode(source));

  @override
  String toString() => 'Unit(id: $id, unit_name: $unit_name)';

  @override
  List<Object> get props => [id, unit_name];
}

class Product extends Equatable {
  final int id;
  final String product_name;
  final List<String> image;
  final String slug;

  const Product({
    required this.id,
    required this.product_name,
    required this.image,
    required this.slug,
  });

  Product copyWith({
    int? id,
    String? product_name,
    List<String>? image,
    String? slug,
  }) {
    return Product(
      id: id ?? this.id,
      product_name: product_name ?? this.product_name,
      image: image ?? this.image,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_name': product_name,
      'image': image,
      'slug': slug,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      product_name: map['product_name'] ?? '',
      image: List<String>.from(map['image'] ?? const []),
      slug: map['slug'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, product_name: $product_name, image: $image, slug: $slug)';
  }

  @override
  List<Object> get props => [id, product_name, image, slug];
}
