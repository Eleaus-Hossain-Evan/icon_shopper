import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../application/profile_provider.dart';

class ContactInfoWidget extends HookConsumerWidget {
  const ContactInfoWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final contactInfoState = ref.watch(contactInfoProvider);

    return contactInfoState.when(
      data: (data) => Column(
        children: [
          "Contact Info".text.xl2.bold.wide.makeCentered(),
          gap24,
          Text.rich(
            style: CustomTextStyles.s14w400Black800,
            TextSpan(
              children: [
                "Address : ".textSpan.bold.letterSpacing(1).make(),
                data.address.textSpan.normal
                    .tap(() => ref
                        .read(profileProvider.notifier)
                        .lunchMap(data.address))
                    .make(),
              ],
            ),
          ),
          gap12,
          Text.rich(
            style: CustomTextStyles.s14w400Black800,
            TextSpan(
              children: [
                "Email : ".textSpan.letterSpacing(1).make(),
                data.email.textSpan.normal
                    .tap(() async => await ref
                        .read(profileProvider.notifier)
                        .lunchEmail(data.email))
                    .make(),
              ],
            ),
          ),
          gap12,
          Text.rich(
            style: CustomTextStyles.s14w400Black800,
            TextSpan(
              children: [
                "Phone : ".textSpan.letterSpacing(1).make(),
                data.phone.textSpan.normal
                    .tap(() => ref
                        .read(profileProvider.notifier)
                        .lunchPhone(data.phone))
                    .make(),
              ],
            ),
          ),
          gap28,
          "Social links".text.xl2.bold.wide.makeCentered(),
          gap12,
          Row(
            mainAxisAlignment: mainCenter,
            children: [
              const KDivider().flexible(),
              gap16,
              IconButton.outlined(
                onPressed: () async =>
                    ref.read(profileProvider.notifier).lunchWhatApp(data.phone),
                icon: Logo(Logos.whatsapp),
              ),
              gap16,
              IconButton.outlined(
                onPressed: () => ref
                    .read(profileProvider.notifier)
                    .launchFacebook() // Facebook
                ,
                padding: padding14,
                icon: Logo(Logos.facebook_logo, size: 22.sp),
              ),
              gap16,
              const KDivider().flexible(),
            ],
          ),
          gap24,
        ],
      ),
      error: (error, stack) => const SizedBox.shrink(),
      loading: () => Column(
        children: [
          "Contact Info".text.xl2.bold.wide.makeCentered(),
          gap24,
          Text.rich(
            style: CustomTextStyles.s14w400Black800,
            TextSpan(
              children: [
                "Address : ".textSpan.bold.letterSpacing(1).make(),
              ],
            ),
          ),
          gap12,
          Text.rich(
            style: CustomTextStyles.s14w400Black800,
            TextSpan(
              children: [
                "Email : ".textSpan.letterSpacing(1).make(),
              ],
            ),
          ),
          gap12,
          Text.rich(
            style: CustomTextStyles.s14w400Black800,
            TextSpan(
              children: [
                "Phone : ".textSpan.letterSpacing(1).make(),
              ],
            ),
          ),
          gap28,
          "Social links".text.xl2.bold.wide.makeCentered(),
          gap12,
          Row(
            mainAxisAlignment: mainCenter,
            children: [
              const KDivider().flexible(),
              gap16,
              IconButton.outlined(
                onPressed: () {},
                icon: Logo(Logos.whatsapp),
              ),
              gap16,
              IconButton.outlined(
                onPressed: () {},
                padding: padding14,
                icon: Logo(Logos.facebook_logo, size: 22.sp),
              ),
              gap16,
              const KDivider().flexible(),
            ],
          ),
          gap24,
        ],
      ).shimmer(),
    );
  }
}
