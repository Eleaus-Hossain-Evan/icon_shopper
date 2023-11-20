import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../../product/presentation/product_detail/product_detail_screen.dart';
import '../../domain/cart_product_model.dart';
import '../application/checkout_provider.dart';

class CartProductTile extends HookConsumerWidget {
  const CartProductTile({
    super.key,
    required this.cartProduct,
    this.isCart = true,
    this.fromProductDetail = false,
  });

  final CartProductModel cartProduct;
  final bool isCart;
  final bool fromProductDetail;

  @override
  Widget build(BuildContext context, ref) {
    final salePrice = cartProduct.product.selectedVariant.salePrice;
    return SizedBox(
      // height: 100.h,
      // decoration: BoxDecoration(
      //   color: AppColors.white,
      //   borderRadius: BorderRadius.circular(8.r),
      //   boxShadow: [
      //     BoxShadow(
      //       color: AppColors.black.withOpacity(0.2),
      //       blurRadius: 4.r,
      //       offset: const Offset(0, 2),
      //     ),
      //     BoxShadow(
      //       color: AppColors.black.withOpacity(0.1),
      //       blurRadius: 1.r,
      //       offset: const Offset(0, -1),
      //     ),
      //   ],
      // ),
      child: KInkWell(
        onTap: fromProductDetail
            ? null
            : () => context.push(
                  "${ProductDetailScreen.route}/${cartProduct.product.id}",
                ),
        borderRadius: BorderRadius.circular(8.r),
        child: Row(
          children: [
            SizedBox(
              width: 120.w,
              height: 100.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
                child: cartProduct.product.image.first.networkImageBaseUrl(
                  isHero: isCart,
                  fit: BoxFit.cover,
                  height: 100.h,
                  width: 120.w,
                ),
              ),
            ),
            gap12,
            Column(
              mainAxisAlignment: mainStart,
              crossAxisAlignment: crossStart,
              children: [
                Row(
                  crossAxisAlignment: crossCenter,
                  children: [
                    cartProduct.product.productName
                        .toTitleCase()
                        .text
                        .maxLines(isCart ? 1 : 2)
                        .isIntrinsic
                        .ellipsis
                        .bold
                        .make()
                        .py12()
                        .expand(),
                    KInkWell(
                      padding: EdgeInsets.all(4.w),
                      onTap: () {
                        ref
                            .read(cartProductProvider.notifier)
                            .removeProduct(cartProduct.product);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 16,
                      ),
                    ).hide(isVisible: isCart),
                    gap10,
                  ],
                ),
                Padding(
                  padding: paddingBottom8,
                  child: Wrap(
                    spacing: 8.w,
                    runSpacing: 6.w,
                    children: [
                      // product variation section
                      Row(
                        mainAxisSize: mainMin,
                        children: [
                          cartProduct
                              .product.availableAttributes.first.name.text
                              .make(),
                          " : ".text.make(),
                          cartProduct
                              .product.selectedVariant.productVariantName.text
                              .colorPrimary(context)
                              .make(),
                        ],
                      ),
                      Row(
                        mainAxisSize: mainMin,
                        children: [
                          // product amount X price; only showing in checkout page..
                          Row(
                            mainAxisSize: mainMin,
                            children: [
                              cartProduct.quantity.toString().text.make(),
                              " x ".text.make(),
                              cartProduct.product.salePrice
                                  .toString()
                                  .text
                                  .make(),
                            ],
                          ).hide(isVisible: !isCart),

                          // product total price
                          Text.rich(
                            TextSpan(
                              children: [
                                "Price: ".textSpan.make(),
                                "${salePrice * cartProduct.quantity}"
                                    .textSpan
                                    .color(context.colors.primary)
                                    .make(),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // cart amount update section(+/-)
                      Row(
                        mainAxisAlignment: mainCenter,
                        mainAxisSize: mainMin,
                        children: [
                          IconButton(
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                            onPressed: () {
                              ref
                                  .read(cartProductProvider.notifier)
                                  .updateProduct(cartProduct.product,
                                      cartProduct.quantity - 1);
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          const VerticalDivider(
                            color: AppColors.black500,
                            thickness: 1,
                            width: 1,
                          ),
                          Text(
                            cartProduct.quantity.toString(),
                          ).centered().w(28.w),
                          const VerticalDivider(
                            color: AppColors.black500,
                            thickness: 1,
                            width: 1,
                          ),
                          IconButton(
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                            onPressed: () {
                              ref
                                  .read(cartProductProvider.notifier)
                                  .updateProduct(cartProduct.product,
                                      cartProduct.quantity + 1);
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      )
                          .box
                          .border(
                            color: AppColors.black400,
                          )
                          .height(30)
                          .make()
                          .pOnly(right: 16.w)
                          .hide(isVisible: isCart),
                    ],
                  ),
                )
              ],
            ).expand(),
          ],
        ),
      ).color(Colors.white).card.elevation(isCart ? 3 : 0).make().py2(),
    );
  }
}
