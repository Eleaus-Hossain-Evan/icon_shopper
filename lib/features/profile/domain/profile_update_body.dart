import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProfileUpdateBody extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String information;
  final String avatar;
  const ProfileUpdateBody({
    required this.name,
    required this.phone,
    required this.email,
    required this.information,
    required this.avatar,
  });

  ProfileUpdateBody copyWith({
    String? name,
    String? phone,
    String? email,
    String? information,
    String? avatar,
  }) {
    return ProfileUpdateBody(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      information: information ?? this.information,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'information': information,
      'avatar': avatar,
    };
  }

  factory ProfileUpdateBody.fromMap(Map<String, dynamic> map) {
    return ProfileUpdateBody(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      information: map['information'] ?? '',
      avatar: map['avatar'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileUpdateBody.fromJson(String source) =>
      ProfileUpdateBody.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileUpdateBody(name: $name, phone: $phone, email: $email, information: $information, avatar: $avatar)';
  }

  @override
  List<Object> get props {
    return [
      name,
      phone,
      email,
      information,
      avatar,
    ];
  }
}
