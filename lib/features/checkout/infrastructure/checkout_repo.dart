import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/checkout/domain/place_order_body.dart';
import 'package:icon_shopper/features/common/domain/simple_response.dart';

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

  Future<Either<CleanFailure, SimpleResponse>> placeOrder(
    PlaceOrderBody body,
  ) async {
    final data = await api.post(
      body: body.toMap(),
      fromData: (json) => SimpleResponse.fromMap(json),
      endPoint: APIRouteEndpoint.PLACE_ORDER,
      withToken: true,
    );

    return data;
  }
}
