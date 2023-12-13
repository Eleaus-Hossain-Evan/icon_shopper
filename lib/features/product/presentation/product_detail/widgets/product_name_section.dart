import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' as rendering;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/core.dart';
import '../../../application/product_provider.dart';

const double extraHeight = 46;

class ProductNameSection extends SliverPersistentHeaderDelegate {
  const ProductNameSection(
    this.ref,
  );

  final WidgetRef ref;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final state = ref.watch(productNotifierProvider);

    final percent = shrinkOffset /
        (getHeight(
              state.productName,
              ref.watch(scaffoldKeyProvider).currentContext!,
              true,
            ) +
            extraHeight);
    final isTrue = (percent > 0.1) || overlapsContent;
    // ref.watch(productTitleOverflow.notifier).update((state) => isTrue);
    return HookConsumer(
      builder: (context, ref, child) {
        return Column(
          mainAxisSize: mainMax,
          mainAxisAlignment: mainCenter,
          children: [
            gap2,
            const KDivider(
              color: AppColors.black300,
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 400),
              alignment: isTrue ? Alignment.center : Alignment.centerLeft,
              child: AnimatedDefaultTextStyle(
                style: TextStyle(
                  fontWeight: isTrue ? FontWeight.w700 : FontWeight.w400,
                  fontFamily: GoogleFonts.jost().fontFamily,
                  height: 1.5,
                  letterSpacing: 0.5,
                ),
                duration: const Duration(milliseconds: 400),
                textAlign: isTrue ? TextAlign.center : TextAlign.start,
                child: state.productName.text.black.xl.make(),
              ),
            ).p16(),
            const KDivider(
              color: AppColors.black300,
            ),
            gap6,
          ],
        ).color(AppColors.bg100);
      },
    );
  }

  @override
  double get maxExtent =>
      getHeight(
        ref.watch(productNotifierProvider).productName,
        ref.watch(scaffoldKeyProvider).currentContext!,
        true,
      ) +
      extraHeight;

  @override
  double get minExtent =>
      getHeight(
        ref.watch(productNotifierProvider).productName,
        ref.watch(scaffoldKeyProvider).currentContext!,
        true,
      ) +
      extraHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

double getHeight(String text, BuildContext context, bool isTitle) {
  var rp = rendering.RenderParagraph(
    TextSpan(
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: GoogleFonts.jost().fontFamily,
          height: 1.5,
          letterSpacing: 0.5,
        ),
        text: text,
        children: null,
        recognizer: null),
    textDirection: rendering.TextDirection.ltr,
    textScaler: const TextScaler.linear(1.25),
  );
  var horizontalPaddingSum = 32.w; // optional
  var width = MediaQuery.of(context).size.width - horizontalPaddingSum;
  // if your Text widget has horizontal padding then you have to
  // subtract it from available width to get the needed results
  var ret = rp.computeMinIntrinsicHeight(width);
  return ret;
}
