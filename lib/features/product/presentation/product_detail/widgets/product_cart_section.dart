import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/core.dart';
import '../../../../checkout/application/checkout_provider.dart';
import '../../../../checkout/presentation/checkout_screen.dart';
import '../../../application/product_provider.dart';

class ProductCartSection extends HookConsumerWidget {
  const ProductCartSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(productNotifierProvider);
    final variant = ref.watch(productVariantProvider);

    final isAvailable = useMemoized<bool>(() {
      return (state.stockProducts.isNotEmpty &&
              state.stockProducts.first.total <= 0) ||
          variant.qty <= 0;
    }, [state.stockProducts, variant.qty]);

    Logger.d('isAvailable $isAvailable');

    return Visibility(
      visible: state.id.isNotNull,
      child: Column(
        mainAxisSize: mainMin,
        children: [
          const KDivider(),
          Row(
            children: [
              KGradientButton(
                onPressed: isAvailable
                    ? null
                    : () {
                        ref.read(cartProductProvider.notifier).addProduct(
                              state.copyWith(
                                selectedVariant:
                                    ref.watch(productVariantProvider),
                              ),
                            );
                      },
                colors: const [
                  Color(0xFF38bdf8),
                  Color(0xFF0385c8),
                ],
                text: 'Add to cart',
              ).expand(),
              gap16,
              KGradientButton(
                onPressed: isAvailable
                    ? null
                    : () {
                        ref.read(cartProductProvider.notifier).addProduct(
                              state.copyWith(
                                selectedVariant:
                                    ref.watch(productVariantProvider),
                              ),
                            );
                        context.push(CheckoutScreen.route);
                      },
                text: 'Buy Now',
              ).expand(),
            ],
          ).pSymmetric(h: 16, v: 8),
        ],
      ),
    );
  }
}
