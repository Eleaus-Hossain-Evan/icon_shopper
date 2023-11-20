import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../domain/coupon_response.dart';

final checkoutRepoProvider = Provider<CheckoutRepo>((ref) {
  return CheckoutRepo();
});

class CheckoutRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, CouponResponse>> checkCoupon(
    String couponCode,
  ) async {
    final data = await api.post(
      body: {"coupon_code": couponCode},
      fromData: (json) => CouponResponse.fromMap(json),
      endPoint: APIRouteEndpoint.COUPON_CHECK,
      withToken: true,
    );

    return data;
  }
}
