import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String information;
  final String avatar;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.information,
    required this.avatar,
  });

  factory UserModel.init() => const UserModel(
      id: 0,
      name: '',
      email: '',
      phone: '',
      gender: '',
      information: '',
      avatar: '');

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? gender,
    String? information,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      information: information ?? this.information,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'information': information,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      gender: map['gender'] ?? '',
      information: map['information'] ?? '',
      avatar: map['avatar'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, phone: $phone, gender: $gender, information: $information, avatar: $avatar)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      phone,
      gender,
      information,
      avatar,
    ];
  }
}
