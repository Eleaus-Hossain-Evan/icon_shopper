import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core.dart';

class KDivider extends StatelessWidget {
  const KDivider({
    Key? key,
    this.padding,
    this.color,
    this.thickness,
    this.height,
    this.visible = true,
  }) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? thickness;
  final double? height;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Divider(
          thickness: thickness ?? 1.h,
          height: height ?? 0,
          color: color ?? AppColors.black600,
        ),
      ),
    );
  }
}
