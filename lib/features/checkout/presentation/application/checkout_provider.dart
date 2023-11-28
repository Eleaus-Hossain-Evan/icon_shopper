import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:icon_shopper/core/core.dart';
import 'package:random_x/random_x.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../product/domain/model/product_model.dart';
import '../../domain/cart_product_model.dart';
import '../../domain/place_order_body.dart';
import '../../domain/promo_data_model.dart';
import '../../infrastructure/checkout_repo.dart';

part 'checkout_provider.g.dart';

@Riverpod(keepAlive: true)
class CartProduct extends _$CartProduct {
  @override
  IList<CartProductModel> build() {
    ref.listenSelf((previous, next) {
      // Logger.v("previous: $previous");
      Logger.i("next: $next");
    });
    return IList();
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
    return null;
  }

  Future<PromoDataModel> applyPromo(String couponCode) async {
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

  Future<bool> placeOrder({
    PromoDataModel? coupon,
    required double shippingCost,
    required String name,
    required String phone,
    required String information,
  }) async {
    state = const AsyncLoading();
    final cart = ref.watch(cartProductProvider);

    final product = cart.map((e) {
      return SProduct(
        variant_id: e.product.selectedVariant.id,
        product_id: e.product.id,
        qty: e.quantity,
        sale_unit_id: e.product.unitId,
        net_unit_price: e.product.selectedVariant.salePrice,
        regular_price: e.product.selectedVariant.regularPrice,
        discount_type:
            e.product.selectedVariant.discountType == "amount" ? 1 : 2,
        discount: e.product.selectedVariant.discount,
        discount_rate: e.product.selectedVariant.discountType == "amount"
            ? e.product.selectedVariant.discount
            : (e.product.selectedVariant.regularPrice *
                    e.product.selectedVariant.discount) /
                100,
        total: e.product.selectedVariant.salePrice * e.quantity,
      );
    }).toList();

    final total = cart
        .map((e) => e.product.selectedVariant.salePrice * e.quantity)
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
      invoice_no: "ECOM-${RndX.guid(length: 6)}",
      customer_id: 1,
      item: 1,
      total_qty: 1,
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
      name: name,
      phone: phone,
      information: information,
    );

    // final result = await ref.read(checkoutRepoProvider).placeOrder(body);
    // return result.fold(
    //   (l) {
    //     showErrorToast(l.error.message);
    //     state = AsyncError(l.error, StackTrace.current);
    //     return false;
    //   },
    //   (r) {
    //     showToast(r.message);
    //     state = const AsyncData(null);
    //     return r.success;
    //   },
    // );
    Logger.d(body);
    return false;
  }
}
