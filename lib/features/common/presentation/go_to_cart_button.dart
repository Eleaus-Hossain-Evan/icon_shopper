import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../checkout/application/checkout_provider.dart';
import '../../checkout/presentation/cart_screen.dart';

class GoToCartButton extends HookConsumerWidget {
  const GoToCartButton({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(cartProductProvider);
    return Hero(
      tag: const ValueKey(CartScreen.route),
      child: IconButton(
        onPressed: onPressed ??
            () {
              context.push(CartScreen.route);
            },
        icon: Badge(
          backgroundColor: context.colors.secondary,
          label: Text(state.length.toString()),
          child: const Icon(Icons.shopping_bag_outlined),
        ),
      ),
    );
  }
}
