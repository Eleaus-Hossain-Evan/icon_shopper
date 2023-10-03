import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';

class LoginScreen extends HookConsumerWidget {
  static const route = '/login';

  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: KAppBar(
        titleText: 'Login',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
