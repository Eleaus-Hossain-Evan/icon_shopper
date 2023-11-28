import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/checkout/domain/promo_data_model.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../profile/presentation/widgets/contact_info_widget.dart';
import '../domain/place_order_body.dart';
import 'application/checkout_provider.dart';
import 'widgets/apply_coupon_widget.dart';
import 'widgets/cart_product_tile.dart';
import 'widgets/payment_method_item.dart';
import 'widgets/price_tile.dart';
import 'widgets/shipping_tile.dart';

class CheckoutScreen extends HookConsumerWidget {
  static const route = '/checkout';

  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProductProvider);

    final selectedShipping = useState(ShippingMethod.inside);

    final selectedPayment = useState(PaymentMethod.cashOnDelivery);

    final appliedPromo = useState<PromoDataModel?>(null);

    final subtotal = useMemoized<double>(() {
      final value = state
          .map((element) =>
              element.product.selectedVariant.salePrice * element.quantity)
          .toList();
      return value.reduce((value, element) => value + element).toDouble();
    }, [state]);

    final discount = useState(appliedPromo.value?.value ?? 0.0);
    final deliveryCharge = useMemoized(() {
      return selectedShipping.value.price;
    }, [selectedShipping.value]);
    ();
    final total = useMemoized(
        () => (subtotal + deliveryCharge) - discount.value,
        [subtotal, discount.value, deliveryCharge, selectedShipping.value]);

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
            "Order Summery".text.xl2.semiBold.makeCentered(),
            gap18,
            ContainerBGWhiteSlideFromRight(
              bgColor: AppColors.bg100,
              borderRadius: radius0,
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  Row(
                    children: [
                      "Cart Item".text.lg.make().expand(),
                      "${state.length} items".text.lg.make(),
                    ],
                  ),
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
                  gap12,
                  const KDivider(color: AppColors.black300),
                  Row(
                    children: [
                      "Apply coupon"
                          .text
                          .lg
                          .bold
                          .colorPrimary(context)
                          .make()
                          .expand(),
                      IconButton(
                        onPressed: () {
                          showCustomDialog(
                            context: context,
                            child: ApplyCouponWidget(
                              onCouponApplied: (promo) =>
                                  appliedPromo.value = PromoDataModel.data(),
                            ),
                          );
                        },
                        icon: Icon(
                          BoxIcons.bxs_coupon,
                          size: 24,
                          color: context.colors.primary,
                        ),
                      ),
                      (appliedPromo.value?.name ?? "").text.sm.bold.make(),
                    ],
                  ),
                  gap12,
                  const KDivider(color: AppColors.black300),
                  gap12,
                  "Select your area".text.make(),
                  gap4,
                  Row(children: [
                    ShippingTile(
                      selectedShipping: selectedShipping,
                      onChanged: (value) {
                        selectedShipping.value = value!;
                      },
                      value: ShippingMethod.inside,
                    ),
                    gap16,
                    ShippingTile(
                      selectedShipping: selectedShipping,
                      onChanged: (value) {
                        selectedShipping.value = value!;
                      },
                      value: ShippingMethod.outside,
                    ),
                  ]),
                  gap12,
                  const KDivider(color: AppColors.black300),
                  gap12,
                  PriceTile(
                    title: AppStrings.subTotal,
                    price: subtotal,
                  ),
                  PriceTile(
                    title: AppStrings.discount,
                    price: appliedPromo.value?.value ?? 0,
                  ),
                  PriceTile(
                    title: AppStrings.deliveryCharge,
                    price: deliveryCharge,
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
                ],
              ),
            ).card.make().px20(),
            gap18,
            Row(
              children: [
                "Payment Method".text.xl2.semiBold.make().expand(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                )
              ],
            ).px24(),
            Row(
              mainAxisAlignment: mainCenter,
              children: [
                PaymentMethodItem(
                  image: Images.onlinePayment,
                  text: PaymentMethod.onlinePayment,
                  selectedPayment: selectedPayment,
                ),
                gap16,
                PaymentMethodItem(
                  image: Images.cod,
                  text: PaymentMethod.cashOnDelivery,
                  selectedPayment: selectedPayment,
                ),
              ],
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

            //. place order button
            KFilledButton(
              loading: ref.watch(checkoutProvider).isLoading,
              onPressed: () {
                ref
                    .read(checkoutProvider.notifier)
                    .placeOrder(
                      coupon: appliedPromo.value,
                      shippingCost: selectedShipping.value.price,
                      name: 'Md. Ogerio Hasan',
                      phone: '01700000000',
                      information: 'House#44 Road # 8/A, Nikunjo-1',
                    )
                    .then((value) {
                  if (value) {
                    Navigator.pop(context);
                  }
                });
              },
              text: 'Place Order',
            ).px32(),
            gap18,
            const KDivider(color: AppColors.black300).px20(),
            gap12,
            const ContactInfoWidget(inDetailScreen: true).px16()
          ],
        ),
      ),
    );
  }
}
