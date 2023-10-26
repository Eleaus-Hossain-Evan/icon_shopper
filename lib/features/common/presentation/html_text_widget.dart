import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlTextWidget extends StatelessWidget {
  const HtmlTextWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: text.isNotEmpty
          ? text
          : '<h4 style="font-family: raleway, sans-serif; font-size: 16px; text-align: center; color: rgba(100, 100, 100, 1);">No data found</h4>',
      onLinkTap: (url, attributes, element) async {
        if (url != null) {
          // context.push("${WebViewScreen.route}?url=$url");
        }
      },
    );
  }
}
