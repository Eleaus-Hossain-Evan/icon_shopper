import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/user_model.dart';

class AuthResponse extends Equatable {
  final bool success;
  final String message;
  final String token;
  final UserModel user;
  const AuthResponse({
    required this.success,
    required this.message,
    required this.token,
    required this.user,
  });

  AuthResponse copyWith({
    bool? success,
    String? message,
    String? token,
    UserModel? user,
  }) {
    return AuthResponse(
      success: success ?? this.success,
      message: message ?? this.message,
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'token': token,
      'user': user.toMap(),
    };
  }

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      token: map['token'] ?? '',
      user: map['user'] != null
          ? UserModel.fromMap(map['user'])
          : UserModel.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthResponse(success: $success, message: $message, token: $token, user: $user)';
  }

  @override
  List<Object> get props => [success, message, token, user];
}
