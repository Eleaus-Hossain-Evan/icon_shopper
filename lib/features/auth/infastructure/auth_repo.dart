import 'package:icon_shopper/features/auth/domain/auth_response.dart';

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
      withToken: true,
    );

    return data;
  }
}
