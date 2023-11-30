import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../../common/presentation/html_text_screen.dart';
import '../../application/profile_provider.dart';

class ContactInfoWidget extends HookConsumerWidget {
  const ContactInfoWidget({
    super.key,
    this.inDetailScreen = false,
  });

  final bool inDetailScreen;

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(contactInfoNotifierProvider);

    // return contactInfoState.when(
    //   data: (data) => Column(
    //     children: [
    //       "Contact Info".text.xl2.bold.wide.makeCentered(),
    //       gap24,
    //       Text.rich(
    //         style: CustomTextStyles.s14w400Black800,
    //         TextSpan(
    //           children: [
    //             "Address : ".textSpan.bold.letterSpacing(1).make(),
    //             data.address.textSpan.normal
    //                 .tap(() => ref
    //                     .read(profileProvider.notifier)
    //                     .lunchMap(data.address))
    //                 .make(),
    //           ],
    //         ),
    //       ),
    //       gap12,
    //       Text.rich(
    //         style: CustomTextStyles.s14w400Black800,
    //         TextSpan(
    //           children: [
    //             "Email : ".textSpan.letterSpacing(1).make(),
    //             data.email.textSpan.normal
    //                 .tap(() async => await ref
    //                     .read(profileProvider.notifier)
    //                     .lunchEmail(data.email))
    //                 .make(),
    //           ],
    //         ),
    //       ),
    //       gap12,
    //       Text.rich(
    //         style: CustomTextStyles.s14w400Black800,
    //         TextSpan(
    //           children: [
    //             "Phone : ".textSpan.letterSpacing(1).make(),
    //             data.phone.textSpan.normal
    //                 .tap(() => ref
    //                     .read(profileProvider.notifier)
    //                     .lunchPhone(data.phone))
    //                 .make(),
    //           ],
    //         ),
    //       ),
    //       gap28,
    //       "Social links".text.xl2.bold.wide.makeCentered(),
    //       gap12,
    //       Row(
    //         mainAxisAlignment: mainCenter,
    //         children: [
    //           const KDivider().flexible(),
    //           gap16,
    //           IconButton.outlined(
    //             onPressed: () async =>
    //                 ref.read(profileProvider.notifier).lunchWhatApp(data.phone),
    //             icon: Logo(Logos.whatsapp),
    //           ),
    //           gap16,
    //           IconButton.outlined(
    //             onPressed: () => ref
    //                 .read(profileProvider.notifier)
    //                 .launchFacebook() // Facebook
    //             ,
    //             padding: padding14,
    //             icon: Logo(Logos.facebook_logo, size: 22.sp),
    //           ),
    //           gap16,
    //           const KDivider().flexible(),
    //         ],
    //       ),
    //       gap24,
    //     ],
    //   ),
    //   error: (error, stack) => const SizedBox.shrink(),
    //   loading: () => Column(
    //     children: [
    //       "Contact Info".text.xl2.bold.wide.makeCentered(),
    //       gap24,
    //       Text.rich(
    //         style: CustomTextStyles.s14w400Black800,
    //         TextSpan(
    //           children: [
    //             "Address : ".textSpan.bold.letterSpacing(1).make(),
    //           ],
    //         ),
    //       ),
    //       gap12,
    //       Text.rich(
    //         style: CustomTextStyles.s14w400Black800,
    //         TextSpan(
    //           children: [
    //             "Email : ".textSpan.letterSpacing(1).make(),
    //           ],
    //         ),
    //       ),
    //       gap12,
    //       Text.rich(
    //         style: CustomTextStyles.s14w400Black800,
    //         TextSpan(
    //           children: [
    //             "Phone : ".textSpan.letterSpacing(1).make(),
    //           ],
    //         ),
    //       ),
    //       gap28,
    //       "Social links".text.xl2.bold.wide.makeCentered(),
    //       gap12,
    //       Row(
    //         mainAxisAlignment: mainCenter,
    //         children: [
    //           const KDivider().flexible(),
    //           gap16,
    //           IconButton.outlined(
    //             onPressed: () {},
    //             icon: Logo(Logos.whatsapp),
    //           ),
    //           gap16,
    //           IconButton.outlined(
    //             onPressed: () {},
    //             padding: padding14,
    //             icon: Logo(Logos.facebook_logo, size: 22.sp),
    //           ),
    //           gap16,
    //           const KDivider().flexible(),
    //         ],
    //       ),
    //       gap24,
    //     ],
    //   ).shimmer(),
    // );

    return Column(
      children: [
        "Contact Info".text.xl2.bold.wide.makeCentered(),
        gap24,
        Text.rich(
          style: CustomTextStyles.s14w400Black800,
          TextSpan(
            children: [
              "Address : ".textSpan.bold.letterSpacing(1).make(),
              data.address.textSpan.normal
                  .tap(() =>
                      ref.read(profileProvider.notifier).lunchMap(data.address))
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
                  .tap(() =>
                      ref.read(profileProvider.notifier).lunchPhone(data.phone))
                  .make(),
            ],
          ),
        ),
        gap28.hide(isVisible: inDetailScreen),
        // "Customer service".text.xl2.bold.wide.makeCentered(),
        ExpansionTile(
          title: "Customer service".text.xl2.bold.wide.make(),
          children: [
            InfoSingleItem(onTap: () {}, text: "Need any help?"),
            InfoSingleItem(onTap: () {}, text: "Order tracking"),
            InfoSingleItem(
              onTap: () => ref.read(profileProvider.notifier).launchMessenger(),
              text: "Live chat",
            ),
          ],
        ).hide(isVisible: inDetailScreen),

        ExpansionTile(
          title: "Information".text.xl2.bold.wide.make(),
          children: [
            InfoSingleItem(
              onTap: () => context.push(
                  "${HtmlTextScreen.route}?title=${AppStrings.termCondition}&url=${APIRouteEndpoint.TERMS_CONDITION}"),
              text: "Terms & Conditions",
            ),
            InfoSingleItem(
              onTap: () => context.push(
                  "${HtmlTextScreen.route}?title=${AppStrings.privacyPolicy}&url=${APIRouteEndpoint.PRIVACY_POLICY}"),
              text: "Privacy-policy",
            ),
            InfoSingleItem(
              onTap: () => context.push(
                  "${HtmlTextScreen.route}?title=${AppStrings.returnPolicy}&url=${APIRouteEndpoint.RETURN_POLICY}"),
              text: "Return",
            ),
            InfoSingleItem(
              onTap: () => context.push(
                  "${HtmlTextScreen.route}?title=${AppStrings.refundPolicy}&url=${APIRouteEndpoint.REFUND_POLICY}"),
              text: "Refund policy",
            ),
          ],
        ).hide(isVisible: inDetailScreen),
        gap28,
        "Social links".text.xl2.bold.wide.make(),
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
            IconButton.outlined(
              onPressed: () => ref
                  .read(profileProvider.notifier)
                  .launchFacebook() // Facebook
              ,
              padding: padding14,
              icon: Logo(Logos.facebook_messenger, size: 22.sp),
            ),
            gap16,
            const KDivider().flexible(),
          ],
        ),
        gap24,
      ],
    );
  }
}

class InfoSingleItem extends StatelessWidget {
  const InfoSingleItem({
    super.key,
    required this.onTap,
    required this.text,
  });

  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return KInkWell(
      onTap: onTap,
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
      child: text.text.lg.make(),
    ).py2();
  }
}
