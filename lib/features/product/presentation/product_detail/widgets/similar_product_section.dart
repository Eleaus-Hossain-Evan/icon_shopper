import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/core/constant/api_routes.dart';
import 'package:icon_shopper/features/product/application/product_provider.dart';
import 'package:velocity_x/velocity_x.dart';

class SimilarProductSection extends HookConsumerWidget {
  const SimilarProductSection({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(similarProductProvider);
    final product = ref.watch(currentProductProvider);

    return Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Similar Products".text.xl2.make(),
            const SizedBox(height: 8),
            state.when(
              data: (data) => Flex(
                direction: Axis.horizontal,
                // spacing: 8,
                // runSpacing: 8,
                children: data
                    .map(
                      (e) => Image.network(
                        APIRouteEndpoint.IMAGE_BASE_URL +
                            APIRouteEndpoint.PRODUCT_IMAGE +
                            e.image.first,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                    .toList(),
              ),
              error: (error, stackTrace) => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    ]);
  }
}
