import 'package:icon_shopper/features/auth/domain/auth_response.dart';
import 'package:icon_shopper/features/auth/domain/signup_body.dart';
import 'package:icon_shopper/features/common/domain/simple_response.dart';

import '../../../core/core.dart';

class AuthRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, AuthResponse>> login({
    required String phone,
    required String password,
  }) async {
    final data = await api.post(
      body: {"phone": phone, "password": password},
      fromData: (json) => AuthResponse.fromMap(json),
      endPoint: APIRoute.LOGIN,
    );

    return data;
  }

  Future<Either<CleanFailure, SimpleResponse>> register(SignUpBody body) async {
    final data = await api.post(
      body: body.toMap(),
      fromData: (json) => SimpleResponse.fromMap(json),
      endPoint: APIRoute.SIGN_UP,
    );

    return data;
  }

  Future<Either<CleanFailure, SimpleResponse>> verifyOtp(String otp) async {
    final data = await api.post(
      body: {"otp": otp},
      fromData: (json) => SimpleResponse.fromMap(json),
      endPoint: APIRoute.VERIFY_OTP,
    );

    return data;
  }
}
