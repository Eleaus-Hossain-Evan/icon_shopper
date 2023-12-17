import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../application/checkout_provider.dart';
import '../../domain/delivery_charge_response.dart';
import 'shipping_tile.dart';

class AreaSection extends HookConsumerWidget {
  const AreaSection({
    super.key,
    required this.selectedShipping,
  });

  final ValueNotifier<DeliveryChargeModel?> selectedShipping;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: crossStart,
      children: [
        "Select your area".text.make(),
        gap4,
        Wrap(
          spacing: 10.w,
          runSpacing: 16.w,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: ref.watch(getDeliveryChargeProvider).when(
                data: (data) {
                  // return [
                  //   VxSkeleton(height: 28.h, width: .35.sw),
                  //   VxSkeleton(height: 28.h, width: .35.sw)
                  // ];
                  return data
                      .map(
                        (e) => ShippingTile(
                          model: e,
                          selectedShipping: selectedShipping,
                          onChanged: (value) {
                            selectedShipping.value = value;
                          },
                        ),
                      )
                      .toList();
                },
                error: (error, stacktrace) {
                  return [
                    Text(error.toString()),
                  ];
                },
                loading: () => [
                  VxSkeleton(height: 22.h, width: .4.sw),
                  VxSkeleton(height: 22.h, width: .4.sw)
                ],
              ),
        ),
      ],
    );
  }
}
