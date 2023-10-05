import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';

class HtmlTextScreen extends HookConsumerWidget {
  static String route = '/html_text';
  const HtmlTextScreen({
    super.key,
    required this.title,
    required this.details,
  });

  final String title;
  final String details;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: KAppBar(titleText: title),
      body: SingleChildScrollView(
        padding: padding20,
        child: Html(
          data: details,
          onLinkTap: (url, attributes, element) async {
            if (url != null) {
              // context.push("${WebViewScreen.route}?url=$url");
            }
          },
        ),
      ),
    );
  }
}
