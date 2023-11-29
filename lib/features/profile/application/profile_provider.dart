import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/profile/domain/model/contact_info_model.dart';
import 'package:icon_shopper/features/profile/domain/model/policy_model.dart';
import 'package:icon_shopper/features/profile/infastructure/profile_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/order_model.dart';

part 'profile_provider.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  void build() {
    return;
  }

  void lunchMap(String address) async {
    await ref.read(profileRepoProvider).lunchMap(address);
  }

  void lunchWhatApp(String number) async {
    await ref.read(profileRepoProvider).lunchWhatApp(number);
  }

  void launchFacebook() async {
    await ref.read(profileRepoProvider).launchFacebook();
  }

  void launchMessenger() async {
    await ref.read(profileRepoProvider).launchMessenger();
  }

  Future<void> lunchEmail(String email) async {
    await ref.read(profileRepoProvider).urlLaunch(Uri.parse("mailto:$email"));
  }

  Future<void> lunchPhone(String phone) async {
    await ref.read(profileRepoProvider).urlLaunch(Uri.parse("tel:+88$phone"));
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

final contactInfoNotifierProvider =
    NotifierProvider<ContactInfoNotifier, ContactInfoModel>(
        ContactInfoNotifier.new);

class ContactInfoNotifier extends Notifier<ContactInfoModel> {
  @override
  ContactInfoModel build() {
    return ContactInfoModel.init();
  }

  void getContactInfo() async {
    final result = await ProfileRepo().getContactInfo();
    state = result.fold(
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

@riverpod
FutureOr<IList<OrderModel>> getOrderList(GetOrderListRef ref) async {
  final result = await ref.read(profileRepoProvider).getOrderList();

  return result.fold((l) {
    showErrorToast(l.error.message);
    return IList();
  }, (r) => r.data.data.lock);
}
