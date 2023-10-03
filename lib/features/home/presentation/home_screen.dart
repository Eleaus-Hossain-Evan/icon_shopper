import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';

class HomeScreen extends HookConsumerWidget {
  static const route = '/home';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: KAppBar(
        titleText: 'Home',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
