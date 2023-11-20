import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/core.dart';

class PriceTile extends HookConsumerWidget {
  const PriceTile({
    super.key,
    required this.title,
    required this.price,
    this.isTotal = false,
  });
  final String title;
  final num price;
  final bool isTotal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: mainSpaceBetween,
      children: [
        Text(
          title,
          style: isTotal
              ? const TextStyle(
                  fontSize: AppSpacing.spaceUnit,
                  fontWeight: FontWeight.w600,
                )
              : null,
        ),
        Text(
          "${AppStrings.tkSymbol} $price",
          style: isTotal
              ? const TextStyle(
                  fontSize: AppSpacing.spaceUnit,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                )
              : null,
        ),
      ],
    );
  }
}
