import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../profile/presentation/widgets/contact_info_widget.dart';
import 'application/checkout_provider.dart';
import 'widgets/cart_product_tile.dart';
import 'widgets/price_tile.dart';

class CheckoutScreen extends HookConsumerWidget {
  static const route = '/checkout';

  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProductProvider);

    final couponCode = useState('');
    final couponDiscount = useState('');

    final selectedShipping = useState(ShippingMethod.inside);

    final selectedPayment = useState(PaymentMethod.cashOnDelivery);

    final subtotal = useMemoized<double>(() {
      final value = state
          .map((element) =>
              element.product.selectedVariant.salePrice * element.quantity)
          .toList();
      return value.reduce((value, element) => value + element).toDouble();
    }, [state]);

    final discount = useState(int.tryParse(couponDiscount.value) ?? 0.0);
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
                              onCouponApplied: (coupon, discount) {
                                couponCode.value = coupon;
                                couponDiscount.value = discount;
                              },
                            ),
                          );
                        },
                        icon: Icon(
                          BoxIcons.bxs_coupon,
                          size: 24,
                          color: context.colors.primary,
                        ),
                      ),
                      couponCode.value.text.sm.bold.make(),
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
                    price:
                        couponDiscount.value.toDoubleOption.toNullable() ?? 0,
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
            KFilledButton(onPressed: () {}, text: 'Place Order').px32(),
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

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.image,
    required this.text,
    required this.selectedPayment,
  });

  final String image;
  final PaymentMethod text;
  final ValueNotifier<PaymentMethod> selectedPayment;

  @override
  Widget build(BuildContext context) {
    return KInkWell(
      onTap: () => selectedPayment.value = text,
      borderRadius: BorderRadius.circular(7.5.r),
      child: Column(
        children: [
          image.assetImage(
            height: 32.h,
            width: 40.w,
          ),
          gap4,
          text.name.toTitleCaseFromCamel().text.bold.make(),
        ],
      )
          .p8()
          .box
          .roundedSM
          .color(selectedPayment.value == text ? Vx.white : Colors.transparent)
          .border(
              color: selectedPayment.value == text
                  ? Colors.transparent
                  : Vx.gray300)
          .make(),
    );
  }
}

class ApplyCouponWidget extends HookConsumerWidget {
  const ApplyCouponWidget({
    super.key,
    required this.onCouponApplied,
  });

  final void Function(String, String) onCouponApplied;

  @override
  Widget build(BuildContext context, ref) {
    final couponController = useTextEditingController();
    return Padding(
      padding: padding20,
      child: Column(
        mainAxisSize: mainMin,
        children: [
          Row(
            children: [
              AppStrings.enterCoupon.text.bold.make().expand(),
              const CloseButton(),
            ],
          ),
          KTextFormField2(
            controller: couponController,
            hintText: AppStrings.promoCodeEnter,
          ),
          gap20,
          ValueListenableBuilder(
              valueListenable: couponController,
              builder: (context, controller, child) {
                return KFilledButton(
                  loading: ref.watch(checkoutProvider).isLoading,
                  onPressed: controller.text.isEmpty
                      ? null
                      : () {
                          FocusScope.of(context).unfocus();
                          ref
                              .read(checkoutProvider.notifier)
                              .applyPromo(couponController.text)
                              .then(
                            (value) {
                              if (value.isNotEmptyAndNotNull) {
                                couponController.clear();
                                onCouponApplied(controller.text, value);
                                Navigator.pop(context);
                              }
                            },
                          );
                        },
                  text: AppStrings.apply,
                );
              })
        ],
      ),
    );
  }
}

class ShippingTile extends StatelessWidget {
  const ShippingTile({
    super.key,
    required this.selectedShipping,
    this.onChanged,
    required this.value,
  });

  final ValueNotifier<ShippingMethod> selectedShipping;
  final void Function(ShippingMethod?)? onChanged;
  final ShippingMethod value;

  @override
  Widget build(BuildContext context) {
    return KInkWell(
      onTap: () {
        onChanged?.call(value);
      },
      child: value.value.text.sm.bold
          .color(value == selectedShipping.value
              ? AppColors.white
              : context.colors.onSurface)
          .make()
          .pSymmetric(v: 4.h, h: 8.w)
          .box
          .border(color: context.colors.onSurface)
          .color(value == selectedShipping.value
              ? context.colors.onSurface
              : AppColors.white)
          .make(),
    );
  }
}
