import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:velocity_x/velocity_x.dart';

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
      style: {
        'h1': Style(
          width: Width.auto(),
        ),
        'h2': Style(
          width: Width.auto(),
        ),
        'h3': Style(
          width: Width.auto(),
        ),
        'h4': Style(
          width: Width.auto(),
        ),
        'h5': Style(
          width: Width.auto(),
        ),
        'h6': Style(
          width: Width.auto(),
        ),
        'table': Style(
          width: Width.auto(),
          textAlign: TextAlign.center,
          border: Border.all(
            color: context.theme.scaffoldBackgroundColor,
            width: 0,
          ),
        ),
        'tbody': Style(
          width: Width(100, Unit.auto),
          border: Border.all(
            color: context.theme.scaffoldBackgroundColor,
            width: 0,
          ),
          textAlign: TextAlign.center,
        ),
        'td': Style(
          // width: Width(100, Unit.percent),
          height: Height(100, Unit.auto),
          padding: HtmlPaddings.symmetric(horizontal: 8.0),
          border: Border.all(color: const Color(0xffd1d5db), width: 1),
          textAlign: TextAlign.center,
        ),
        'tr': Style(
          // width: Width(100, Unit.percent),
          padding: HtmlPaddings.symmetric(horizontal: 8.0),
          border: Border.all(color: const Color(0xffd1d5db), width: 1),
          textAlign: TextAlign.center,
        ),
        'th': Style(
          width: Width(100, Unit.auto),
          border: Border.all(color: const Color(0xffd1d5db), width: 1),
          textAlign: TextAlign.center,
        ),
      },
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
