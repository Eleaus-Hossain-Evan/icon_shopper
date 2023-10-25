import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/product/application/product_provider.dart';

class ProductAppBar extends HookConsumerWidget {
  const ProductAppBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(currentProductProvider);
    return SliverAppBar.large(
      floating: true,
      pinned: true,
      // snap: true,
      expandedHeight: 90.h,
      primary: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          state.productName,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
