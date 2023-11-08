import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import 'application/checkout_provider.dart';
import 'checkout_screen.dart';
import 'widgets/cart_product_tile.dart';
import 'widgets/price_tile.dart';

class CartScreen extends HookConsumerWidget {
  static const route = '/cart';

  const CartScreen({
    super.key,
    this.fromProductDetail = false,
  });

  final bool fromProductDetail;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProductProvider);

    final couponController = useTextEditingController();

    final subtotal = useMemoized<double>(() {
      if (state.isEmpty) {
        return 0.0;
      }
      final value = state
          .map((element) => element.product.salePrice * element.quantity)
          .toList();
      return value.reduce((value, element) => value + element).toDouble();
    }, [state]);

    final discount = useState(0.0);
    final deliveryCharge = useState(0.0);
    final total = useMemoized(
        () => subtotal - discount.value + deliveryCharge.value,
        [subtotal, discount.value, deliveryCharge.value]);

    return Scaffold(
      appBar: const KAppBar(
        titleText: 'Cart',
      ),
      body: Column(
        children: [
          gap10,
          Expanded(
            child: state.isEmpty
                ? Center(
                    child: 'No items in cart'.text.make(),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.length,
                    padding: paddingH16,
                    separatorBuilder: (context, index) => gap8,
                    itemBuilder: (context, index) {
                      return CartProductTile(
                        cartProduct: state[index],
                        fromProductDetail: fromProductDetail,
                      );
                      // return Container(
                      //   height: 100.h,
                      //   color: Colors.red,
                      // );
                    },
                  ),
            // child: SizedBox.expand(),
          ),
          gap10,
          Padding(
            padding: paddingH20,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: KTextFormField2(
                    controller: couponController,
                    hintText: AppStrings.enterCoupon,
                  ),
                ),
                gap20,
                Expanded(
                  flex: 3,
                  child: ValueListenableBuilder(
                      valueListenable: couponController,
                      builder: (context, value, child) {
                        return KFilledButton(
                          onPressed: value.text.isEmpty
                              ? null
                              : () {
                                  // ref
                                  //     .read(cartProvider.notifier)
                                  //     .applyPromo(couponController.text)
                                  //     .then(
                                  //   (value) {
                                  //     value ? couponController.clear() : null;
                                  //   },
                                  // );
                                },
                          text: AppStrings.apply,
                        );
                      }),
                )
              ],
            ),
          ),
          gap20,
          Padding(
            padding: paddingH20,
            child: Column(
              children: [
                gap10,
                PriceTile(
                  title: AppStrings.subTotal,
                  price: subtotal,
                ),
                PriceTile(
                  title: AppStrings.discount,
                  price: discount.value,
                ),
                PriceTile(
                  title: AppStrings.deliveryCharge,
                  price: deliveryCharge.value,
                ),
                Divider(
                  thickness: 1,
                  color: context.colors.secondaryContainer,
                ),
                PriceTile(
                  title: AppStrings.total,
                  price: total,
                  isTotal: true,
                ),
                gap10,
              ],
            ),
          ).box.white.shadowSm.roundedSM.make().px24(),
          gap10,
          Padding(
            padding: paddingH20,
            child: KFilledButton(
              onPressed: state.isEmpty
                  ? null
                  : () {
                      // if (ref.watch(loggedInProvider).loggedIn) {
                      context.push(CheckoutScreen.route);
                      // } else {
                      //   context.pushNamed(SignInScreen.route);
                      // }
                      // context.pushNamed(CheckoutScreen.route);
                    },
              text: AppStrings.checkout,
            ),
          ),
          gap10,
        ],
      ),
    );
  }
}
