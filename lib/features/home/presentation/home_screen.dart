import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';

class HomeScreen extends HookConsumerWidget {
  static const route = '/home';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: KAppBar(
        title: Images.logoSmall.assetImage(height: kToolbarHeight - 36.h),
      ),
      body: SingleChildScrollView(
        padding: padding16,
        child: const Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
