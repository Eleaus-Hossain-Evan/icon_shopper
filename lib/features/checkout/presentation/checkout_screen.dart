import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../../features/auth/application/auth_provider.dart';
import '../../../features/checkout/domain/promo_data_model.dart';
import '../../../features/checkout/presentation/widgets/customer_info_section.dart';
import '../../profile/presentation/widgets/contact_info_widget.dart';
import '../application/checkout_provider.dart';
import '../domain/delivery_charge_response.dart';
import 'order_success_screen.dart';
import 'widgets/area_section.dart';
import 'widgets/cart_product_tile.dart';
import 'widgets/coupon_section.dart';
import 'widgets/payment_method_item.dart';
import 'widgets/price_tile.dart';

class CheckoutScreen extends HookConsumerWidget {
  static const route = '/checkout';

  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProductProvider);
    final auth = ref.watch(authProvider);

    final name = useState(auth.user.name);
    final phone = useState(auth.user.phone);
    final address = useState(auth.user.information);

    final selectedShipping = useState<DeliveryChargeModel?>(null);

    final selectedPayment = useState(PaymentMethod.cashOnDelivery);

    final appliedPromo = useState<PromoDataModel?>(null);

    final subtotal = useMemoized<double>(() {
      if (state.isEmpty) {
        return 0.0;
      }
      return state
          .map((element) {
            final hasVariation = element.product.productVariationStatus == 1;
            final discountPrice = hasVariation
                ? element.product.selectedVariant.salePrice
                : element.product.salePrice;
            return discountPrice * element.quantity;
          })
          .reduce((value, element) => value + element)
          .toDouble();
    }, [state]);

    final total = useMemoized(
        () =>
            (subtotal - (appliedPromo.value?.value ?? 0)) +
            (selectedShipping.value?.value ?? 0),
        [subtotal, appliedPromo.value?.value, selectedShipping.value?.value]);

    return Scaffold(
      backgroundColor: AppColors.bg200,
      appBar: const KAppBar(
        titleText: 'Checkout',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      "Cart Overview".text.lg.make().expand(),
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
                  CouponSection(appliedPromo: appliedPromo),
                  gap12,
                  const KDivider(color: AppColors.black300),
                  gap12,
                  AreaSection(selectedShipping: selectedShipping),
                  gap12,
                  const KDivider(color: AppColors.black300),
                  gap12,
                  PriceTile(
                    title: AppStrings.subTotal,
                    price: subtotal,
                  ),
                  // PriceTile(
                  //   title: AppStrings.discount,
                  //   price: discount,
                  //   isPercentage: true,
                  // ),
                  PriceTile(
                    title: AppStrings.couponDiscount,
                    price: (appliedPromo.value?.value ?? 0),
                    isPercentage: appliedPromo.value?.type == 1,
                  ),
                  PriceTile(
                    title: AppStrings.deliveryCharge,
                    price: (selectedShipping.value?.value ?? 0),
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

            CustomerInfoSection(name: name, phone: phone, address: address),

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
                if (name.value.isEmpty) {
                  showErrorToast('Please enter your name');
                  return;
                }
                if (phone.value.isEmpty) {
                  showErrorToast('Please enter your phone number');
                  return;
                }
                if (address.value.isEmpty) {
                  showErrorToast('Please enter your address');
                  return;
                }
                ref
                    .read(checkoutProvider.notifier)
                    .placeOrder(
                      cart: state,
                      coupon: appliedPromo.value,
                      shippingCost:
                          (selectedShipping.value?.value ?? 0).toDouble(),
                      name: name.value,
                      phone: phone.value,
                      information: address.value,
                    )
                    .then((value) {
                  final (isSuccess, invoiceId) = value;
                  if (isSuccess) {
                    context.pushReplacement(
                        '${OrderSuccessScreen.route}/$invoiceId?method=${selectedPayment.value.name}&&totalPrice=$total&&address=${address.value}');
                  }
                });
                // Logger.i(GoRouter.of(context).routerDelegate);
                // context.pushReplacement(
                //     '${OrderSuccessScreen.route}/123?method=${selectedPayment.value.name}&&totalPrice=$total&&address=${address.value}');
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
