import 'package:icon_shopper/features/profile/domain/contact_info_response.dart';
import 'package:icon_shopper/features/profile/domain/policy_response.dart';

import '../../../core/core.dart';

class ProfileRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, ContactInfoResponse>> getContactInfo() async {
    final data = await api.get(
      fromData: (json) => ContactInfoResponse.fromMap(json),
      endPoint: APIRoute.CONTACT_INFO,
      withToken: true,
    );

    return data;
  }

  Future<Either<CleanFailure, PolicyResponse>> getTermCondition() async {
    final data = await api.get(
      fromData: (json) => PolicyResponse.fromMap(json),
      endPoint: APIRoute.TERMS_CONDITION,
      withToken: true,
    );

    return data;
  }

  Future<Either<CleanFailure, PolicyResponse>> getPrivacyPolicy() async {
    final data = await api.get(
      fromData: (json) => PolicyResponse.fromMap(json),
      endPoint: APIRoute.PRIVACY_POLICY,
      withToken: true,
    );

    return data;
  }

  Future<Either<CleanFailure, PolicyResponse>> getRefundPolicy() async {
    final data = await api.get(
      fromData: (json) => PolicyResponse.fromMap(json),
      endPoint: APIRoute.REFUND_POLICY,
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
}
