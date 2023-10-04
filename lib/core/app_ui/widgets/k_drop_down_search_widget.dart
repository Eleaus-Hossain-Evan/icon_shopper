import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core.dart';

class KDropDownSearchWidget<T> extends HookConsumerWidget {
  const KDropDownSearchWidget({
    Key? key,
    this.selectedItem,
    required this.hintText,
    this.isLabel = true,
    this.enabled = true,
    this.contentPadding =
        const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
    this.containerMargin,
    this.fillColor = Colors.transparent,
    this.borderColor = AppColors.secondary200,
    this.hintTextStyle,
    this.asyncItems,
    this.itemAsString,
    this.compareFn,
    this.onChanged,
    this.items = const [],
    this.popupProps = const PopupProps.menu(
      // showSelectedItems: true,
      fit: FlexFit.loose,
      menuProps: MenuProps(
        backgroundColor: AppColors.bg200,
      ),
    ),
    this.focusNode,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  final T? selectedItem;
  final String hintText;
  final bool isLabel, enabled;
  final EdgeInsets? contentPadding, containerMargin;
  final Color fillColor, borderColor;
  final TextStyle? hintTextStyle;
  final Future<List<T>> Function(String)? asyncItems;
  final String Function(T)? itemAsString;
  final bool Function(T, T)? compareFn;
  final void Function(T?)? onChanged;
  final List<T> items;
  final PopupProps<T> popupProps;
  final FocusNode? focusNode;
  final String? Function(T?)? validator;
  final void Function(T?)? onSaved;

  @override
  Widget build(BuildContext context, ref) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(
        color: AppColors.black600,
        width: 1,
      ),
    );

    return AnimatedContainer(
      duration: 400.milliseconds,
      margin: containerMargin ??
          (enabled
              ? EdgeInsets.symmetric(horizontal: 20.w)
              : EdgeInsets.symmetric(horizontal: 10.w)),
      child: Focus(
        focusNode: focusNode,
        child: DropdownSearch<T>(
          popupProps: popupProps,
          items: items,
          selectedItem: selectedItem,
          itemAsString: itemAsString,
          enabled: enabled,
          validator: validator,
          autoValidateMode: AutovalidateMode.onUserInteraction,
          dropdownDecoratorProps: DropDownDecoratorProps(
            // baseStyle: CustomTextStyle.textStyle14w400B900,
            dropdownSearchDecoration: InputDecoration(
              hintText: isLabel ? null : hintText,
              // hintStyle: hintTextStyle ?? CustomTextStyle.textStyle14w500B800,
              labelText: isLabel ? hintText : null,
              // labelStyle: enabled
              //     ? CustomTextStyle.textStyle12w400B800
              //     : CustomTextStyle.textStyle14w400B800,
              contentPadding: contentPadding,
              fillColor: fillColor,
              border: border,
              enabledBorder: border,
              focusedBorder: border.copyWith(
                borderSide: BorderSide(
                  color: borderColor,
                ),
              ),
              disabledBorder: border.copyWith(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              filled: true,
            ),
          ),
          asyncItems: asyncItems,
          compareFn: compareFn,
          onChanged: onChanged,
          onSaved: onSaved,
        ),
      ),
    );
  }
}
