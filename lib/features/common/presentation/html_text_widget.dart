import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';

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
          : '<h6 style="font-family: raleway, sans-serif; font-size: 16px; font-weight: 400; text-align: center; color: rgba(100, 100, 100, 1);">No data found</h6>',
      onLinkTap: (url, attributes, element) async {
        if (url != null) {
          // context.push("${WebViewScreen.route}?url=$url");
        }
      },
      onCssParseError: (css, errors) {
        Logger.e(css);
        Logger.e(errors);
        return null;
      },
      extensions: const [
        TableHtmlExtension(),
      ],
    );
  }
}
