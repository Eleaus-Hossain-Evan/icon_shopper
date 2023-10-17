import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/core.dart';
import '../../application/profile_provider.dart';
import '../profile_detail_screen.dart';

class ContactInfoWidget extends HookConsumerWidget {
  const ContactInfoWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final contactInfoState = ref.watch(contactInfoProvider);

    Future<void> lunchWhatApp(String phone) async {
      try {
        final url = Uri.parse(
            "whatsapp://send?phone=+88$phone&text=${Uri.encodeFull('Looking for something?...')}");
        await launchUrl(url);
      } on Exception {
        final url = Uri.parse(
            "https://wa.me/88$phone&text=${Uri.encodeFull('Looking for something?...')}");
        await launchUrl(url);
      }
    }

    Future<void> launchFacebook(String url) async {
      try {
        bool launched =
            await launchUrl(Uri.parse(url)); // Launch the app if installed!

        if (!launched) {
          launchUrl(Uri.parse(url),
              mode: LaunchMode
                  .inAppWebView); // Launch web view if app is not installed!
        }
      } catch (e) {
        launchUrl(Uri.parse(url),
            mode: LaunchMode
                .inAppWebView); // Launch web view if app is not installed!
      }
    }

    Future<void> lunchMap(String address) async {
      String encodedAddress = Uri.encodeComponent(address);
      String googleMapUrl =
          "https://www.google.com/maps/search/?api=1&query=$encodedAddress";
      String appleMapUrl = "http://maps.apple.com/?q=$encodedAddress";
      if (Platform.isAndroid) {
        try {
          if (await canLaunchUrl(Uri.parse(googleMapUrl))) {
            await launchUrl(Uri.parse(googleMapUrl));
          }
        } catch (error) {
          throw ("Cannot launch Google map");
        }
      }
      if (Platform.isIOS) {
        try {
          if (await canLaunchUrl(Uri.parse(appleMapUrl))) {
            await launchUrl(Uri.parse(appleMapUrl));
          }
        } catch (error) {
          throw ("Cannot launch Apple map");
        }
      }
    }

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
                    .tap(() async => await lunchMap(data.address))
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
                data.email.textSpan.normal.tap(() {
                  launchUrl(Uri.parse("mailto:${data.email}"));
                }).make(),
              ],
            ),
          ),
          gap12,
          Text.rich(
            style: CustomTextStyles.s14w400Black800,
            TextSpan(
              children: [
                "Phone : ".textSpan.letterSpacing(1).make(),
                data.phone.textSpan.normal.tap(() {
                  launchUrl(Uri.parse("tel:${data.phone}"));
                }).make(),
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
                onPressed: () async => lunchWhatApp(data.phone),
                icon: Logo(Logos.whatsapp),
              ),
              gap16,
              IconButton.outlined(
                onPressed: () {
                  // launchFacebook("https://www.facebook.com/iconshopperbd");
                  launchFacebook(
                      'https://www.facebook.com/iconshopperbd'); // Facebook
                },
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
