import 'dart:convert';

import 'package:equatable/equatable.dart';

class ContactInfoModel extends Equatable {
  final String address;
  final String name;
  final String email;
  final String phone;
  final String facebook;
  final String logo;
  const ContactInfoModel({
    required this.address,
    required this.name,
    required this.email,
    required this.phone,
    required this.facebook,
    required this.logo,
  });

  factory ContactInfoModel.init() => const ContactInfoModel(
      address: '', name: '', email: '', phone: '', facebook: '', logo: '');

  ContactInfoModel copyWith({
    String? address,
    String? name,
    String? email,
    String? phone,
    String? facebook,
    String? logo,
  }) {
    return ContactInfoModel(
      address: address ?? this.address,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      facebook: facebook ?? this.facebook,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'name': name,
      'email': email,
      'phone': phone,
      'facebook': facebook,
      'logo': logo,
    };
  }

  factory ContactInfoModel.fromMap(Map<String, dynamic> map) {
    return ContactInfoModel(
      address: map['address'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      facebook: map['facebook'] ?? '',
      logo: map['logo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactInfoModel.fromJson(String source) =>
      ContactInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ContactInfoModel(address: $address, name: $name, email: $email, phone: $phone, facebook: $facebook, logo: $logo)';
  }

  @override
  List<Object> get props {
    return [
      address,
      name,
      email,
      phone,
      facebook,
      logo,
    ];
  }
}
