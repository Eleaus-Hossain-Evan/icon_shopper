import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core.dart';

class KShimmerWidget extends HookConsumerWidget {
  const KShimmerWidget({
    super.key,
    this.baseColor = AppColors.bg200,
    this.highlightColor = AppColors.pastelGrey,
    this.height,
    this.width,
    this.borderRadius,
  });

  final Color baseColor;
  final Color highlightColor;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radius = borderRadius ?? BorderRadius.circular(6.r);
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        height: height ?? DefaultTextStyle.of(context).style.fontSize! * 1,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: radius,
        ),
      ),
    );
  }
}

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
    this.baseColor = AppColors.bg200,
    this.highlightColor = AppColors.pastelGrey,
  });

  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final Color baseColor;
  final Color highlightColor;

  @override
  Widget build(BuildContext context, ref) {
    final radius = borderRadius ?? BorderRadius.circular(6.r);
    return VxSkeleton(
      height: height ?? 32.h,
      width: width ?? 1.sw,
      borderRadius: radius,
      color: baseColor,
      shimmerColor: highlightColor,
    );
  }
}

class PackageItemShimmer extends StatelessWidget {
  const PackageItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: ListTile(
        title: Builder(
          builder: (context) {
            return Row(
              children: [
                Container(
                  height: DefaultTextStyle.of(context).style.fontSize! * .8,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: DefaultTextStyle.of(context).style.fontSize! * .8,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        subtitle: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Container(
                    height: DefaultTextStyle.of(context).style.fontSize! * .8,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: DefaultTextStyle.of(context).style.fontSize! * .8,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
