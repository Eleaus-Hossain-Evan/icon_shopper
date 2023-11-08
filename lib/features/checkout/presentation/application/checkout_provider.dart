import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../product/domain/model/product_model.dart';
import '../../domain/cart_product_model.dart';

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
    final model = CartProductModel(product: product, quantity: 1);
    state = state.add(model);

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
    state = state
        .removeWhere((element) => element.product.id == product.id)
        .removeNullsAndDuplicates();
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

    final value =
        state.where((element) => element.product.id == product.id).first;
    if (quantity == 0) {
      // removeProduct(product);
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
