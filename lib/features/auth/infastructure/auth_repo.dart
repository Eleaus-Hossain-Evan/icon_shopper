import 'package:icon_shopper/features/auth/domain/auth_response.dart';
import 'package:icon_shopper/features/auth/domain/signup_body.dart';
import 'package:icon_shopper/features/common/domain/simple_response.dart';
import 'package:icon_shopper/features/profile/domain/change_password_body.dart';

import '../../../core/core.dart';
import '../../profile/domain/profile_update_body.dart';

class AuthRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, AuthResponse>> login({
    required String phone,
    required String password,
  }) async {
    final data = await api.post(
      body: {"phone": phone, "password": password},
      fromData: (json) => AuthResponse.fromMap(json),
      endPoint: APIRouteEndpoint.LOGIN,
    );

    return data;
  }

  Future<Either<CleanFailure, SimpleResponse>> register(SignUpBody body) async {
    final data = await api.post(
      body: body.toMap(),
      fromData: (json) => SimpleResponse.fromMap(json),
      endPoint: APIRouteEndpoint.SIGN_UP,
    );

    return data;
  }

  Future<Either<CleanFailure, SimpleResponse>> verifyOtp(String otp) async {
    final data = await api.post(
      body: {"otp": otp},
      fromData: (json) => SimpleResponse.fromMap(json),
      endPoint: APIRouteEndpoint.VERIFY_OTP,
    );

    return data;
  }

  Future<Either<CleanFailure, AuthResponse>> profileView() async {
    final data = await api.get(
      fromData: (json) => AuthResponse.fromMap(json),
      endPoint: APIRouteEndpoint.PROFILE_VIEW,
      withToken: true,
    );

    return data;
  }

  Future<Either<CleanFailure, AuthResponse>> updateProfile(
    ProfileUpdateBody body,
  ) async {
    final data = await api.post(
      body: body.toMap(),
      fromData: (json) => SimpleResponse.fromMap(json),
      endPoint: APIRouteEndpoint.PROFILE_UPDATE,
      withToken: true,
    );

    return profileView();
  }

  Future<Either<CleanFailure, SimpleResponse>> passwordUpdate(
    ChangePasswordBody body,
  ) async {
    final data = await api.post(
      body: body.toMap(),
      fromData: (json) => SimpleResponse.fromMap(json),
      endPoint: APIRouteEndpoint.PASSWORD_CHANGE,
      withToken: true,
    );

    return data;
  }
}
