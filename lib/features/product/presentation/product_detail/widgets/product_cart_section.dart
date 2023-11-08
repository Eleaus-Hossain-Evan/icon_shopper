import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/core.dart';
import '../../../../checkout/domain/cart_product_model.dart';
import '../../../../checkout/presentation/application/checkout_provider.dart';
import '../../../application/product_provider.dart';

class ProductCartSection extends HookConsumerWidget {
  const ProductCartSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final product = ref.watch(currentProductProvider);
    final cartList = ref.watch(cartProductProvider);
    final variant = ref.watch(productVariantProvider);

    final currentCart = useMemoized(() {
      return cartList
          .where((element) =>
              element.product.id == product.id &&
              element.product.selectedVariant.id == variant.id)
          .firstOrElse(() => CartProductModel(product: product, quantity: 0));
    }, [cartList, product.id, variant]);

    final isProductInCart = useMemoized(() {
      final value = cartList.indexWhere((element) =>
          element.product.id == product.id &&
          element.product.selectedVariant.id == variant.id);
      return value >= 0;
    }, [cartList, product.id, variant]);

    return Column(
      mainAxisSize: mainMin,
      children: [
        const KDivider(),
        Row(
          children: [
            KFilledButton(onPressed: () {}, text: 'Buy Now').expand(),
            gap16,
            isProductInCart
                ? Row(
                    mainAxisAlignment: mainCenter,
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          backgroundColor: context.colors.secondaryContainer,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          foregroundColor: AppColors.white,
                        ),
                        onPressed: () {
                          currentCart.quantity == 1
                              ? ref
                                  .read(cartProductProvider.notifier)
                                  .removeProduct(product)
                              : ref
                                  .read(cartProductProvider.notifier)
                                  .updateProduct(
                                      product, currentCart.quantity - 1);
                        },
                        icon: currentCart.quantity == 1
                            ? const Icon(Icons.delete)
                            : const Icon(Icons.remove),
                      ),
                      currentCart.quantity
                          .toString()
                          .text
                          .bold
                          .lg
                          .makeCentered()
                          .w15(context),
                      IconButton(
                        style: IconButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          backgroundColor: context.colors.secondaryContainer,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          foregroundColor: AppColors.white,
                        ),
                        onPressed: () {
                          ref
                              .read(cartProductProvider.notifier)
                              .updateProduct(product, currentCart.quantity + 1);
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ).expand()
                : KFilledButton(
                        onPressed: () {
                          ref.read(cartProductProvider.notifier).addProduct(
                                product.copyWith(
                                  selectedVariant:
                                      ref.watch(productVariantProvider),
                                ),
                              );
                        },
                        text: isProductInCart
                            ? 'Remove from cart'
                            : 'Add to cart')
                    .expand(),
          ],
        ).pSymmetric(h: 16, v: 8),
      ],
    );
  }
}
