import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/auth/application/auth_provider.dart';
import 'package:icon_shopper/features/home/presentation/widgets/home_category.dart';
import 'package:icon_shopper/features/home/presentation/widgets/home_slider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../application/home_provider.dart';
import 'widgets/home_latest_product.dart';
import 'widgets/home_search.dart';

class HomeScreen extends HookConsumerWidget {
  static const route = '/home';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: KAppBar(
        title: Images.logoSmall.assetImage(height: kToolbarHeight - 36.h),
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: HomeSearch(ref),
            ),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          await Future.wait([
            // Future.microtask(
            //     () => ref.read(homeDataProvider.notifier).getData()),
          ]);
        },
        child: SingleChildScrollView(
          padding: padding0,
          child: Column(
            children: [
              const HomeSlider(),
              gap36,
              const HomeCategoryWidget(),
              gap36,
              const HomeLatestProductWidget(),
              Images.home.assetImage(),
            ],
          ),
        ),
      ),
    );
  }
}
