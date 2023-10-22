import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/home/presentation/widgets/home_category.dart';
import 'package:icon_shopper/features/home/presentation/widgets/home_slider.dart';

import '../../../core/core.dart';
import '../application/home_provider.dart';

class HomeScreen extends HookConsumerWidget {
  static const route = '/home';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeDataProvider);
    return Scaffold(
      appBar: KAppBar(
        title: Images.logoSmall.assetImage(height: kToolbarHeight - 36.h),
      ),
      body: SingleChildScrollView(
        padding: padding0,
        child: Column(
          children: [
            const HomeSlider(),
            gap36,
            const HomeCategoryWidget(),
            gap36,
            state.when(
              data: (data) => Text(data.toString()),
              error: (error, stackTrace) {
                log(error.toString(), stackTrace: stackTrace);
                return Text(error.toString());
              },
              loading: () => const CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
