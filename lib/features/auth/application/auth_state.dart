import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:icon_shopper/features/auth/domain/model/user_model.dart';

class AuthState extends Equatable {
  final bool loading;
  final UserModel user;
  const AuthState({
    required this.loading,
    required this.user,
  });

  factory AuthState.init() {
    return AuthState(
      loading: false,
      user: UserModel.init(),
    );
  }

  AuthState copyWith({
    bool? loading,
    UserModel? user,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loading': loading,
      'user': user.toMap(),
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      loading: map['loading'] ?? false,
      user: UserModel.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthState.fromJson(String source) =>
      AuthState.fromMap(json.decode(source));

  @override
  String toString() => 'AuthState(loading: $loading, user: $user)';

  @override
  List<Object> get props => [loading, user];
}
