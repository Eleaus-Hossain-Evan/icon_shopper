import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignUpBody extends Equatable {
  final String name;
  final String phone;
  final String password;
  const SignUpBody({
    required this.name,
    required this.phone,
    required this.password,
  });

  SignUpBody copyWith({
    String? name,
    String? phone,
    String? password,
  }) {
    return SignUpBody(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'password': password,
    };
  }

  factory SignUpBody.fromMap(Map<String, dynamic> map) {
    return SignUpBody(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpBody.fromJson(String source) =>
      SignUpBody.fromMap(json.decode(source));

  @override
  String toString() =>
      'SignupBody(name: $name, phone: $phone, password: $password)';

  @override
  List<Object> get props => [name, phone, password];
}
