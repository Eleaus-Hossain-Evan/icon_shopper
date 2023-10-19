import 'dart:async';

import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/profile/domain/model/contact_info_model.dart';
import 'package:icon_shopper/features/profile/domain/model/policy_model.dart';
import 'package:icon_shopper/features/profile/infastructure/profile_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  void build() {
    return;
  }

  void lunchMap(String address) async {
    await ProfileRepo().lunchMap(address);
  }

  void lunchWhatApp(String number) async {
    await ProfileRepo().lunchWhatApp(number);
  }

  void launchFacebook() async {
    await ProfileRepo().launchFacebook();
  }

  Future<void> lunchEmail(String email) async {
    await ProfileRepo().urlLaunch(Uri.parse("mailto:$email"));
  }

  Future<void> lunchPhone(String phone) async {
    await ProfileRepo().urlLaunch(Uri.parse("tel:+88$phone"));
  }
}

@riverpod
class ContactInfo extends _$ContactInfo {
  @override
  FutureOr<ContactInfoModel> build() async {
    final result = await ProfileRepo().getContactInfo();
    return result.fold(
      (l) {
        showErrorToast(l.error.message);
        return ContactInfoModel.init();
      },
      (r) => r.data,
    );
  }
}

@riverpod
class GetPolicy extends _$GetPolicy {
  @override
  FutureOr<PolicyModel> build({required String url}) async {
    final result = await ProfileRepo().getPolicy(url);
    return result.fold((l) {
      showErrorToast(l.error.message);
      return PolicyModel.init();
    }, (r) => r.data);
  }
}
