import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:icon_shopper/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../product/domain/model/product_model.dart';
import '../../domain/cart_product_model.dart';
import '../../infrastructture/checkout_repo.dart';

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

  Future<String> applyPromo(String couponCode) async {
    state = const AsyncLoading();
    return await ref
        .read(checkoutRepoProvider)
        .checkCoupon(couponCode)
        .then((value) => value.fold((l) {
              showErrorToast(l.error.message);
              state = AsyncError(l.error, StackTrace.current);
              return '';
            }, (r) {
              showToast(r.message);
              state = const AsyncData(null);
              return couponCode;
            }));
  }
}
