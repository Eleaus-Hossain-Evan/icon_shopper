import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class KShimmerContainer extends StatelessWidget {
  const KShimmerContainer({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const ListTile(),
    );
  }
}

class KSkeletonWidget extends HookConsumerWidget {
  const KSkeletonWidget({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
  });

  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context, ref) {
    final radius = borderRadius ?? BorderRadius.circular(6.r);
    return VxSkeleton(
      height: height,
      width: width,
      borderRadius: radius,
    );
  }
}
