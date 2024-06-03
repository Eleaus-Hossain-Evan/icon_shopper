import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/home/domain/home_response.dart';
import 'package:icon_shopper/features/home/domain/paginated_product_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/campaign_detail_response.dart';
import '../domain/model/campaign_model.dart';
import '../infrastructure/home_repo.dart';

part 'home_provider.g.dart';

// @riverpod
// class HomeData extends _$HomeData {
//   @override
//   FutureOr<HomeResponse> build() async {
//     return HomeResponse.init();
//   }

//   void getData() async {
//     state = const AsyncLoading();

//     state = await AsyncValue.guard(() async {
//       final result = await HomeRepo().getHomeData();
//       return result.fold((l) {
//         showErrorToast(l.error.message);
//         return HomeResponse.init();
//       }, (r) => r);
//     });
//   }
// }

final homeDataProvider = FutureProvider<HomeResponse>((ref) async {
  final result = await HomeRepo().getHomeData();
  return result.fold((l) {
    showErrorToast(l.error.message);
    return HomeResponse.init();
  }, (r) => r);
});

class HomeDataNotifier extends AsyncNotifier<HomeResponse> {
  @override
  FutureOr<HomeResponse> build() async {
    return HomeResponse.init();
  }

  void getData() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final result = await HomeRepo().getHomeData();
      return result.fold((l) {
        showErrorToast(l.error.message);
        return HomeResponse.init();
      }, (r) => r);
    });
  }
}

@riverpod
class SearchProduct extends _$SearchProduct {
  @override
  FutureOr<PaginatedProductResponse> build(
    String query, {
    int page = 1,
  }) async {
    final result = await HomeRepo().searchProduct(query, page: page);
    return result.fold((l) {
      showErrorToast(l.error.message);
      return PaginatedProductResponse.init();
    }, (r) => r);
  }
}

@riverpod
FutureOr<IList<CampaignModel>> getCampaign(GetCampaignRef ref) async {
  final result = await HomeRepo().getCampaign();
  return result.fold((l) {
    showErrorToast(l.error.message);
    return IList();
  }, (r) => r.campaigns);
}

@riverpod
FutureOr<CampaignListResponse> campaignDetail(
  CampaignDetailRef ref, {
  required String slug,
}) async {
  final result = await HomeRepo().campaignDetail(slug);
  return result.fold((l) {
    showErrorToast(l.error.message);
    return CampaignListResponse.init();
  }, (r) => r);
}
