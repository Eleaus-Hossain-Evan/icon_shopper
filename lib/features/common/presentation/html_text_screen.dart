import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/profile/application/profile_provider.dart';

import '../../../core/core.dart';

class HtmlTextScreen extends HookConsumerWidget {
  static String route = '/html_text';
  const HtmlTextScreen({
    super.key,
    required this.title,
    required this.url,
  });

  final String title;
  final String url;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getPolicyProvider(url: url));

    return Scaffold(
      appBar: KAppBar(titleText: title),
      body: SingleChildScrollView(
        padding: padding20,
        child: state.when(
          data: (data) => Html(
            data: data.details,
            onLinkTap: (url, attributes, element) async {
              if (url != null) {
                // context.push("${WebViewScreen.route}?url=$url");
              }
            },
          ),
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
