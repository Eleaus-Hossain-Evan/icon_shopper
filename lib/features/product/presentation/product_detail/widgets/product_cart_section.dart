import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/core.dart';
import '../../../../checkout/domain/cart_product_model.dart';
import '../../../../checkout/application/checkout_provider.dart';
import '../../../application/product_provider.dart';

class ProductCartSection extends HookConsumerWidget {
  const ProductCartSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final product = ref.watch(productNotifierProvider);
    final cartList = ref.watch(cartProductProvider);
    final variant = ref.watch(productVariantProvider);

    // final currentCart = useMemoized(() {
    //   return cartList
    //       .where((element) =>
    //           element.product.id == product.id &&
    //           element.product.selectedVariant.id == variant.id)
    //       .firstOrElse(() => CartProductModel(product: product, quantity: 0));
    // }, [cartList, product.id, variant]);

    // final isProductInCart = useMemoized(() {
    //   final value = cartList.indexWhere((element) =>
    //       element.product.id == product.id &&
    //       element.product.selectedVariant.id == variant.id);
    //   return value >= 0;
    // }, [cartList, product.id, variant]);

    return Column(
      mainAxisSize: mainMin,
      children: [
        const KDivider(),
        Row(
          children: [
            KGradientButton(
              onPressed: () {},
              colors: const [
                Color(0xFF38bdf8),
                Color(0xFF0385c8),
              ],
              text: 'Buy Now',
            ).expand(),
            gap16,
            KGradientButton(
              onPressed: () {
                ref.read(cartProductProvider.notifier).addProduct(
                      product.copyWith(
                        selectedVariant: ref.watch(productVariantProvider),
                      ),
                    );
              },
              text: 'Add to cart',
            ).expand(),
          ],
        ).pSymmetric(h: 16, v: 8),
      ],
    );
  }
}
