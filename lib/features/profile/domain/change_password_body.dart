import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChangePasswordBody extends Equatable {
  final String current_password;
  final String password;
  final String password_confirmation;
  const ChangePasswordBody({
    required this.current_password,
    required this.password,
    required this.password_confirmation,
  });

  ChangePasswordBody copyWith({
    String? current_password,
    String? password,
    String? password_confirmation,
  }) {
    return ChangePasswordBody(
      current_password: current_password ?? this.current_password,
      password: password ?? this.password,
      password_confirmation:
          password_confirmation ?? this.password_confirmation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_password': current_password,
      'password': password,
      'password_confirmation': password_confirmation,
    };
  }

  factory ChangePasswordBody.fromMap(Map<String, dynamic> map) {
    return ChangePasswordBody(
      current_password: map['current_password'] ?? '',
      password: map['password'] ?? '',
      password_confirmation: map['password_confirmation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangePasswordBody.fromJson(String source) =>
      ChangePasswordBody.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChangePasswordBody(current_password: $current_password, password: $password, password_confirmation: $password_confirmation)';

  @override
  List<Object> get props => [current_password, password, password_confirmation];
}
