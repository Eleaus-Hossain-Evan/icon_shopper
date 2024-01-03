import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/checkout/domain/delivery_charge_response.dart';
import 'package:random_x/random_x.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/application/auth_provider.dart';
import '../../product/domain/model/product_model.dart';
import '../domain/cart_product_model.dart';
import '../domain/place_order_body.dart';
import '../domain/promo_data_model.dart';
import '../infrastructure/checkout_repo.dart';

part 'checkout_provider.g.dart';

@Riverpod(keepAlive: true)
class CartProduct extends _$CartProduct {
  @override
  IList<CartProductModel> build() {
    ref.listenSelf((previous, next) {
      // Logger.v("previous: $previous");
      Logger.i("next: $next");
    });
    return IList(const []);
  }

  void addProduct(ProductModel product) async {
    final value = state
        .where((element) =>
            element.product.id == product.id &&
            element.product.selectedVariant.id == product.selectedVariant.id)
        .firstOrNull;
    if (value != null) {
      showErrorToast("Already added to cart");
    } else {
      state = state.add(CartProductModel(product: product, quantity: 1));
      showToast("Added to cart");
    }

    Logger.v("added product: $product");
  }

  // add or remove
  void toggleProduct(ProductModel product) async {
    // final model = CartProductModel(product: product, quantity: 1);
    final value = state.indexWhere((element) => element.product == product);
    if (value != -1) {
      removeProduct(product);
    } else {
      addProduct(product);
    }
  }

  void removeProduct(ProductModel product) async {
    state = state.removeWhere((element) =>
        element.product.id == product.id &&
        element.product.selectedVariant.id == product.selectedVariant.id);
    Logger.v("product remove");
  }

  void clearCart() async {
    state = IList();
  }

  void updateProduct(ProductModel product, int quantity) async {
    // final model = CartProductModel(product: product, quantity: quantity);
    // final index = state.indexOf(model);
    // // state = state.removeAt(index).add(product);
    // state = state.replace(index, model);

    final value = state
        .where((element) =>
            element.product.id == product.id &&
            element.product.selectedVariant.id == product.selectedVariant.id)
        .first;
    if (quantity == 0) {
      // removeProduct(product);
    } else if (product.selectedVariant.qty < quantity) {
      showErrorToast("Only ${product.selectedVariant.qty} left in stock");
    } else {
      state = state.replace(
          state.indexOf(value), value.copyWith(quantity: quantity));
    }
    Logger.v("product update");
  }

  bool isProductInCart(ProductModel product) {
    final value = state.indexWhere((element) => element.product == product);
    return value != -1;
  }
}

@riverpod
class Checkout extends _$Checkout {
  @override
  FutureOr<void> build() {
    ref.listenSelf((previous, next) {
      // Logger.v("previous: $previous");
      Logger.i("next: $next");
    });
    return null;
  }

  Future<PromoDataModel?> applyPromo(String couponCode) async {
    state = const AsyncLoading();
    return await ref
        .read(checkoutRepoProvider)
        .checkCoupon(couponCode)
        .then((value) => value.fold((l) {
              showErrorToast(l.error.message);
              state = AsyncError(l.error, StackTrace.current);
              return PromoDataModel.init();
            }, (r) {
              showToast(r.message);
              state = const AsyncData(null);
              return r.data;
            }));
  }

  Future<(bool, String)> placeOrder({
    PromoDataModel? coupon,
    required double shippingCost,
    required String name,
    required String phone,
    required String information,
    required IList<CartProductModel> cart,
  }) async {
    state = const AsyncLoading();

    final user = ref.watch(authProvider).user;
    final invoiceId = "ECOM-${RndX.guid(length: 6)}";

    final product = cart.map((e) {
      final hasVariation = e.product.productVariationStatus == 1;

      final regularPrice = hasVariation
          ? e.product.selectedVariant.regularPrice
          : e.product.regularPrice;
      final discount = hasVariation
          ? e.product.selectedVariant.discount
          : e.product.discount;

      final discountPrice = hasVariation
          ? e.product.selectedVariant.salePrice
          : e.product.salePrice;
      return SProduct(
        variant_id: e.product.selectedVariant.id,
        product_id: e.product.id!,
        qty: e.quantity,
        sale_unit_id: e.product.unitId,
        net_unit_price: discountPrice,
        regular_price: regularPrice,
        discount_type: 2,
        discount: discount,
        discount_rate: ((regularPrice * discount) / 100) * e.quantity,
        total: discountPrice * e.quantity,
      );
    }).toList();

    final total = product
        .map((e) => e.total)
        .toList()
        .reduce((value, element) => value + element)
        .toDouble();
    final body = PlaceOrderBody(
      s_product: product,
      coupon_id: coupon?.id,
      coupon_type: coupon?.type,
      coupon_discount: coupon?.type != null ? coupon?.value : null,
      coupon_rate: coupon?.type != null
          ? coupon?.type == 1
              ? coupon?.value
              : ((total * (coupon?.value ?? 0)) / 100)
          : null,
      invoice_no: invoiceId,
      item: cart.length,
      total_qty: cart
          .map((element) => element.quantity)
          .toList()
          .reduce((a, b) => a + b),
      shipping_cost: shippingCost,
      net_total: total,
      grand_total: coupon?.type != null
          ? coupon?.type == 1
              ? (total - (coupon?.value ?? 0) + shippingCost)
              : coupon?.type == 2
                  ? (total -
                      (total * (coupon?.value ?? 0) / 100) +
                      shippingCost)
                  : total + shippingCost
          : total + shippingCost,
      sale_date: DateTime.now().toFormatDate('yyyy-MM-dd'),
      customer_id: user.id,
      name: name,
      phone: phone,
      information: information,
    );

    final result = await ref.read(checkoutRepoProvider).placeOrder(body);
    return result.fold(
      (l) {
        showErrorToast(l.error.message);
        state = AsyncError(l.error, StackTrace.current);
        return (false, '');
      },
      (r) {
        ref.read(cartProductProvider.notifier).clearCart();
        state = const AsyncData(null);
        showToast(r.message);
        return (r.success, invoiceId);
      },
    );

    // Logger.d(body);
    // return (true, invoiceId);
  }
}

@riverpod
FutureOr<IList<DeliveryChargeModel>> getDeliveryCharge(
    GetDeliveryChargeRef ref) async {
  return await ref.read(checkoutRepoProvider).getDeliveryCharge().then(
        (value) => value.fold(
          (l) {
            showErrorToast(l.error.message);
            return IList(const []);
          },
          (r) {
            return r.data.lock;
          },
        ),
      );
}
