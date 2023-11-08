import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';


import '../../../core/core.dart';
import 'application/checkout_provider.dart';
import 'widgets/cart_product_tile.dart';
import 'widgets/price_tile.dart';

class CheckoutScreen extends HookConsumerWidget {
  static const route = '/checkout';

  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProductProvider);

    final selectedShipping = useState(ShippingMethod.inside);

    final selectedPayment = useState(PaymentMethod.cashOnDelivery);

    final subtotal = useMemoized<double>(() {
      final value = state
          .map((element) => element.product.salePrice * element.quantity)
          .toList();
      return value.reduce((value, element) => value + element).toDouble();
    }, [state]);

    final discount = useState(0.0);
    final deliveryCharge = useState(0.0);
    final total = useMemoized(
        () =>
            subtotal -
            discount.value +
            deliveryCharge.value +
            selectedShipping.value.price,
        [
          subtotal,
          discount.value,
          deliveryCharge.value,
          selectedShipping.value
        ]);

    return Scaffold(
      backgroundColor: AppColors.bg200,
      appBar: const KAppBar(
        titleText: 'Checkout',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            gap16,
            "BILLING & SHIPPING".text.xl2.semiBold.makeCentered(),
            gap14,
            ContainerBGWhiteSlideFromRight(
              bgColor: AppColors.bg100,
              borderRadius: radius0,
              padding: paddingV20,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      "Md. Ogerio Hasan".text.make(),
                      gap2,
                      "Phone: 01700000000".text.make(),
                      gap2,
                      "Address: House#44 Road # 8/A,".text.make(),
                      gap2,
                      "Nikunjo-1, Dhaka, 1212,".text.make(),
                    ],
                  ).px16().expand(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ).card.make().px20(),
            gap16,
            "ADDITIONAL INFORMATION".text.xl2.semiBold.makeCentered(),
            gap14,
            "Order notes (optional)".text.make().objectCenterLeft().px32(),
            gap6,
            const KTextFormField2(
              hintText: 'e.g. Special notes for delivery.',
              isLabel: false,
              maxLines: null,
            ).px32(),
            gap18,
            "Your Order".text.xl2.semiBold.makeCentered(),
            gap18,
            ContainerBGWhiteSlideFromRight(
              bgColor: AppColors.bg100,
              borderRadius: radius0,
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  "Product".text.lg.make(),
                  gap8,
                  const KDivider(color: AppColors.black300),
                  gap8,
                  ListView.separated(
                    itemBuilder: (context, index) => CartProductTile(
                      cartProduct: state[index],
                      isCart: false,
                    ),
                    separatorBuilder: (context, index) =>
                        const KDivider(color: AppColors.black300),
                    itemCount: state.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  gap8,
                  const KDivider(color: AppColors.black300),
                  gap12,
                  PriceTile(
                    title: AppStrings.subTotal,
                    price: subtotal,
                  ),
                  gap12,
                  const KDivider(color: AppColors.black300),
                  gap12,
                  Row(
                    children: [
                      "Shipping".text.make(),
                      Column(
                        crossAxisAlignment: crossEnd,
                        children: [
                          ShippingTile(
                            value: ShippingMethod.inside,
                            selectedShipping: selectedShipping,
                            onChanged: (value) {
                              selectedShipping.value = value!;
                            },
                          ),
                          ShippingTile(
                            value: ShippingMethod.urgent,
                            selectedShipping: selectedShipping,
                            onChanged: (value) {
                              selectedShipping.value = value!;
                            },
                          ),
                          ShippingTile(
                            value: ShippingMethod.pickShowroom,
                            selectedShipping: selectedShipping,
                            onChanged: (value) {
                              selectedShipping.value = value!;
                            },
                          ),
                        ],
                      ).expand()
                    ],
                  ),
                  gap12,
                  const KDivider(color: AppColors.black300),
                  gap12,
                  PriceTile(
                    title: AppStrings.total,
                    price: total,
                    isTotal: true,
                  ),
                ],
              ),
            ).card.make().px20(),
            gap18,
            RadioListTile.adaptive(
              value: PaymentMethod.cashOnDelivery,
              groupValue: selectedPayment.value,
              onChanged: (value) {
                selectedPayment.value = value!;
              },
              title: "Cash on Delivery".text.make(),
            ),
            RadioListTile.adaptive(
              value: PaymentMethod.bKash,
              groupValue: selectedPayment.value,
              onChanged: (value) {
                selectedPayment.value = value!;
              },
              title: "bKash Payment Gateway".text.make(),
            ),
            gap12,
            const KDivider(color: AppColors.black300).px20(),
            gap12,
            "Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our privacy policy and terms and conditions"
                .text
                .sm
                .make()
                .px20(),
            gap12,
            KFilledButton(onPressed: () {}, text: 'Place Order').px32(),
            gap12,
          ],
        ),
      ),
    );
  }
}

class ShippingTile extends StatelessWidget {
  const ShippingTile({
    Key? key,
    required this.selectedShipping,
    this.onChanged,
    required this.value,
  }) : super(key: key);

  final ValueNotifier<ShippingMethod> selectedShipping;
  final void Function(ShippingMethod?)? onChanged;
  final ShippingMethod value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainEnd,
      children: [
        value.value.text.make(),
        Radio(
          value: value,
          groupValue: selectedShipping.value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
