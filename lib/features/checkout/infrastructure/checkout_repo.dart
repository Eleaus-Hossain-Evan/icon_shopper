import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/checkout/domain/delivery_charge_response.dart';
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
    log("place order body: ${body.toJson()}");
    final data = await api.post(
      body: body.toMap(),
      fromData: (json) => SimpleResponse.fromMap(json),
      endPoint: APIRouteEndpoint.PLACE_ORDER,
      withToken: true,
    );

    return data;
  }

  Future<Either<CleanFailure, DeliveryChargeResponse>>
      getDeliveryCharge() async {
    return await api.get(
      fromData: (json) => DeliveryChargeResponse.fromMap(json),
      endPoint: APIRouteEndpoint.DELIVERY_CHARGE,
      withToken: true,
    );
  }
}

const order = """

{
    "success": true,
    "message": "Order created successfully.",
    "product_details": {
        "id": 2322,
        "invoice_no": "ECOM-699473",
        "item": 2,
        "total_qty": 3,
        "total_price": 5670,
        "shipping_cost": 60,
        "coupon_type": null,
        "coupon_discount": null,
        "coupon_rate": null,
        "grand_total": 5730,
        "sale_date": "2023-12-13",
        "payment_method": "1",
        "total_tax": 0,
        "order_tax_rate": null,
        "name": "alvi",
        "phone": "01939418891",
        "information": "123 rtweart",
        "optional_information": null,
        "sale_product_list": [
            {
                "id": 7341,
                "product_code": "91542168",
                "variant_id": 6013,
                "sale_id": 2322,
                "product_id": 781,
                "qty": 2,
                "sale_unit_id": 1,
                "regular_price": 1890,
                "net_unit_price": 1890,
                "discount": 0,
                "discount_type": 1,
                "discount_rate": 0,
                "tax_rate": 0,
                "tax": 0,
                "total": 3780,
                "product": {
                    "id": 781,
                    "product_name": "MEN'S PREMIUM JACKET",
                    "product_code": null,
                    "sku": "72J",
                    "slug": "mens-premium-jacket~72J"
                },
                "unit": {
                    "id": 1,
                    "unit_name": "Piece"
                },
                "product_variant": {
                    "id": 6013,
                    "product_variant_name": "M",
                    "product_code": "91542168"
                }
            },
            {
                "id": 7342,
                "product_code": "47304302",
                "variant_id": 5987,
                "sale_id": 2322,
                "product_id": 806,
                "qty": 1,
                "sale_unit_id": 1,
                "regular_price": 1890,
                "net_unit_price": 1890,
                "discount": 0,
                "discount_type": 1,
                "discount_rate": 0,
                "tax_rate": 0,
                "tax": 0,
                "total": 1890,
                "product": {
                    "id": 806,
                    "product_name": "MEN'S PREMIUM JACKET",
                    "product_code": null,
                    "sku": "81J",
                    "slug": "mens-premium-jacket~81J"
                },
                "unit": {
                    "id": 1,
                    "unit_name": "Piece"
                },
                "product_variant": {
                    "id": 5987,
                    "product_variant_name": "XL",
                    "product_code": "47304302"
                }
            }
        ]
    }
}
""";
