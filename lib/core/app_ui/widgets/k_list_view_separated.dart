import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KListViewSeparated extends StatelessWidget {
  const KListViewSeparated(
      {Key? key,
      this.shrinkWrap = false,
      this.physics = const BouncingScrollPhysics(),
      required this.itemBuilder,
      this.separator,
      this.alternateWidget,
      required this.itemCount,
      this.scrollDirection = Axis.vertical,
      this.gap = 0,
      this.controller,
      this.edgePadding,
      this.padding,
      this.reverse = false})
      : super(key: key);

  final bool shrinkWrap;
  final ScrollPhysics physics;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget? separator, alternateWidget;
  final int itemCount;
  final Axis scrollDirection;
  final double gap;
  final ScrollController? controller;
  final double? edgePadding;
  final EdgeInsetsGeometry? padding;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      scrollDirection: scrollDirection,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemBuilder: itemCount == 0
          ? (context, index) =>
              Center(child: alternateWidget ?? const Text('No data found'))
          : itemBuilder,
      controller: controller,
      reverse: reverse,
      separatorBuilder: (context, index) {
        return separator ??
            (scrollDirection == Axis.vertical
                ? SizedBox(
                    height: gap.h,
                  )
                : SizedBox(
                    width: gap.w,
                  ));
      },
      itemCount: itemCount == 0 ? 1 : itemCount,
    );
  }
}
