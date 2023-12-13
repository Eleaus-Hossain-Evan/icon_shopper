import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/common/presentation/product_grid_tile.dart';
import 'package:icon_shopper/features/product/application/product_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/core.dart';

class SimilarProductSection extends HookConsumerWidget {
  const SimilarProductSection({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(similarProductProvider);

    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: crossStart,
      children: [
        gap18,
        "Similar Products".text.xl.bold.wide.make().px20(),
        gap8,
        state.when(
          data: (data) => GridView(
            // direction: Axis.horizontal,
            // spacing: 8,
            // runSpacing: 8,
            padding: paddingH20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 18.w,
              childAspectRatio: 180 / 335,
            ),
            children: data
                .map(
                  (e) => ProductGridTile(data: e, defaultFont: 12),
                )
                .toList(),
          ),
          error: (error, stackTrace) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
        ),
      ],
    )
        .box
        .roundedSM
        .border(color: Colors.grey[200]!, width: 1.5)
        .margin(const EdgeInsets.symmetric(horizontal: AppSpacing.lg))
        .make();
  }
}
