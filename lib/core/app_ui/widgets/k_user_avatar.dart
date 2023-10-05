import 'package:cached_network_image/cached_network_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/auth/application/auth_provider.dart';
import '../../core.dart';
import '../../utils/utils.dart';
import 'widgets.dart';

class KUserAvatar extends HookConsumerWidget {
  const KUserAvatar({
    Key? key,
    this.imgUrl,
    this.radius = 20,
    this.onTap,
    this.icon,
    this.enableBorder = false,
    this.bgColor,
  }) : super(key: key);

  final String? imgUrl;
  final double radius;
  final bool enableBorder;
  final VoidCallback? onTap;
  final Widget? icon;
  final Color? bgColor;

  @override
  Widget build(BuildContext context, ref) {
    final isEmptyUrl =
        imgUrl?.isEmpty ?? ref.watch(authProvider).user.avatar.isEmpty;
    final url = imgUrl ?? ref.watch(authProvider).user.avatar;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius + 1),
      child: KInkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.w),
        padding: EdgeInsets.all(4.w),
        child: Hero(
          tag: isEmptyUrl ? UniqueKey() : url,
          child: CircleAvatar(
            radius: enableBorder ? radius + 1 : radius - 1,
            backgroundColor: bgColor ?? context.colors.primary,
            child: CircleAvatar(
              radius: radius,
              backgroundColor:
                  bgColor ?? Theme.of(context).colorScheme.background,
              backgroundImage: !isEmptyUrl
                  ? CachedNetworkImageProvider(
                      url,
                      errorListener: (error) => error.toString().text.make(),
                    )
                  : null,
              child: isEmptyUrl ? icon ?? const Icon(Icons.person) : null,
            ),
          ),
        ),
      ),
    );
  }
}
