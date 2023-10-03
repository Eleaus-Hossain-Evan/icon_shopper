import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core.dart';

class RecentParcelShimmerWidget extends StatelessWidget {
  const RecentParcelShimmerWidget({
    super.key,
    this.length,
  });

  final int? length;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: KListViewSeparated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gap: 16,
        padding: padding0,
        itemBuilder: (context, index) {
          // final parcel = data.data[index];

          return Column(
            children: [
              VxSkeleton(
                height: 18.h,
                borderRadius: BorderRadius.circular(6.r),
              ),
              gap8,
              Row(
                children: [
                  VxSkeleton(
                    height: 100.h,
                    width: 100.h,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  gap16,
                  Column(
                    mainAxisAlignment: mainSpaceBetween,
                    children: [
                      VxSkeleton(
                        height: 24.h,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      gap10,
                      VxSkeleton(
                        height: 24.h,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      gap10,
                      VxSkeleton(
                        height: 24.h,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ],
                  ).flexible(),
                  gap16,
                  Column(
                    mainAxisAlignment: mainSpaceBetween,
                    children: [
                      VxSkeleton(
                        height: 34.h,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      gap20,
                      VxSkeleton(
                        height: 34.h,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ],
                  ).w(60.w),
                ],
              ),
              gap16,
            ],
          );
        },
        itemCount: length ?? 2,
        separator: KDivider(
          color: AppColors.white,
          thickness: 2.2.h,
        ),
      ),
    );
  }
}
