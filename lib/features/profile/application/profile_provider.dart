import 'dart:async';

import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/profile/domain/model/contact_info_model.dart';
import 'package:icon_shopper/features/profile/domain/model/policy_model.dart';
import 'package:icon_shopper/features/profile/infastructure/profile_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

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
  FutureOr<PolicyModel> build({required String url})async {
    final result =await ProfileRepo().getPolicy(url);
    return result.fold((l) {
      showErrorToast(l.error.message);
      return PolicyModel.init();
    }, (r) => r.data) ;
  }
}
