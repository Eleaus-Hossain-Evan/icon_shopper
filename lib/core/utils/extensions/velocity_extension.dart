part of 'extensions.dart';

extension TextColor on VxTextBuilder {
  VxTextBuilder colorPrimary(BuildContext context) =>
      color(context.colors.primary);
  VxTextBuilder colorSecondary(BuildContext context) =>
      color(context.colors.secondary);
  VxTextBuilder colorScaffoldBackground(BuildContext context,
          {double? opacity}) =>
      color(context.theme.scaffoldBackgroundColor.withOpacity(opacity ?? 1));
}

extension BoxColor on VxBox {
  VxBox colorPrimary(BuildContext context, {double? opacity}) =>
      color(context.colors.primary.withOpacity(opacity ?? 1));

  VxBox colorSecondary(BuildContext context, {double? opacity}) =>
      color(context.colors.secondary.withOpacity(opacity ?? 1));

  VxBox colorScaffoldBackground(BuildContext context, {double? opacity}) =>
      color(context.theme.scaffoldBackgroundColor.withOpacity(opacity ?? 1));
}
