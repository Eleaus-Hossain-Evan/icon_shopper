part of 'extensions.dart';

extension XDateTimeExtension on DateTime {
  String formatToWord() {
    return DateFormat.yMMMMd().format(this);
  }

  String formatToWordWithTime() {
    return "${DateFormat("d MMM y").format(this)}, ${DateFormat.jm().format(this)}";
  }

  String toFormatDate([String pattern = 'dd/MM/yyyy', String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  String toFormatDividerDate([String pattern = 'dd-MM-yyyy', String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}

extension XDateTimeOnStringExtension on String {
  String formatToWord() {
    return DateFormat.yMMMMd().format(toDate()!);
  }

  String formatToWordWithTime() {
    return "${DateFormat("d MMM y").format(toDate()!)}, ${DateFormat.jm().format(toDate()!)}";
  }

  String toFormatDate([String pattern = 'dd/MM/yyyy', String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(toDate()!);
  }

  String toFormatDividerDate([String pattern = 'dd-MM-yyyy', String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(toDate()!);
  }

  String toFormatShortDate([String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat('EEE, MMM d, yy', locale).format(toDate()!);
  }

  String toFormatFullDate([String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat.MMMMEEEEd(locale).format(toDate()!);
  }
}
