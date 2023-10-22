import 'dart:io';

import 'package:icon_shopper/features/profile/domain/contact_info_response.dart';
import 'package:icon_shopper/features/profile/domain/policy_response.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/core.dart';

class ProfileRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, ContactInfoResponse>> getContactInfo() async {
    final data = await api.get(
      fromData: (json) => ContactInfoResponse.fromMap(json),
      endPoint: APIRouteEndpoint.CONTACT_INFO,
      withToken: true,
    );

    return data;
  }

  Future<Either<CleanFailure, PolicyResponse>> getPolicy(String url) async {
    final data = await api.get(
      fromData: (json) => PolicyResponse.fromMap(json),
      endPoint: url,
      withToken: false,
    );

    return data;
  }

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

  Future<void> launchFacebook({
    String url = 'https://www.facebook.com/iconshopperbd',
  }) async {
    try {
      bool launched =
          await canLaunchUrl(Uri.parse(url)); // Launch the app if installed!

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

  Future<void> urlLaunch(Uri url,
      {LaunchMode mode = LaunchMode.platformDefault}) async {
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: mode);
      }
    } catch (error) {
      throw ("Cannot launch url");
    }
  }
}
