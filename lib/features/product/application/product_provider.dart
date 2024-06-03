import 'dart:async';

import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/core.dart';
import '../../../features/product/domain/model/product_model.dart';
import '../../../features/product/domain/model/product_variant_model.dart';
import '../../../features/product/domain/product_response.dart';
import '../../../features/product/infrastructure/product_repo.dart';
import '../domain/model/product_stock_model.dart';

part 'product_provider.g.dart';

final productTitleOverflow = StateProvider<bool>((ref) {
  return false;
}, name: 'productTitleOverflow');

//' Category wise product by Slug
@riverpod
Future<List<ProductModel>> categoryWiseProduct(
  CategoryWiseProductRef ref, {
  int page = 1,
  required String slug,
}) async {
  final data = await ProductRepo().categoryWiseProduct(
    slug: slug,
    page: page,
  );
  return data.fold(
    (l) {
      showErrorToast(l.error.message);
      return [];
    },
    (r) => r.data.data,
  );
}

//' All product
@riverpod
FutureOr<List> allProduct(AllProductRef ref, {int page = 1}) async {
  final data = await ProductRepo().getAllProduct(page: page);
  return data.fold(
    (l) {
      showErrorToast(l.error.message);
      return [];
    },
    (r) => r.new_arrival.data,
  );
}

//' Product's slug
final slugProvider = StateProvider<String>((ref) {
  return '';
}, name: 'slugProvider');

//' Product's details
final getProductDetailsProvider = FutureProvider<ProductResponse>((ref) async {
  final slug = ref.watch(slugProvider);
  final result = await ProductRepo().getProductDetails(slug);
  return result.fold((l) {
    showErrorToast(l.error.message);
    return ProductResponse.init();
  }, (r) => r);
}, name: 'getProductDetailsProvider');

//' Product's selected variant
final productVariantProvider =
    StateProvider.autoDispose<ProductVariantModel>((ref) {
  final state = ref.watch(productNotifierProvider);

  final variant =
      state.productVariants != null && state.productVariants!.isNotEmpty
          ? state.productVariants![0]
          : ProductVariantModel.init();

  return variant;
}, name: 'productVariantProvider');

@riverpod
class ProductNotifier extends _$ProductNotifier {
  @override
  ProductModel build() {
    final product = ref.watch(getProductDetailsProvider);
    return product.when(
      data: (data) => data.data,
      error: (error, stackTrace) => ProductModel.init(),
      loading: () => ProductModel.init(),
    );
  }

  void copyProductUrl() {
    ref.read(productRepoProvider).copyProductUrl(state.slug);
  }

  void shareToFB() async {
    await ref.read(productRepoProvider).shareOnFacebook(state.slug);
  }
}

//' Similar Products of a product
final similarProductProvider =
    FutureProvider.autoDispose<List<ProductModel>>((ref) async {
  final state = ref.watch(productNotifierProvider);

  if (state.id == null) return [];

  final result = await ref.read(productRepoProvider).similarProduct(state.id!);
  return result.fold((l) {
    showErrorToast(l.error.message);
    return [];
  }, (r) => r.data);
}, name: 'similarProductProvider');

//' Product's stock
@riverpod
class ProductStock extends _$ProductStock {
  @override
  FutureOr<List<ProductStockModel>> build() {
    return [];
  }

  void getStock(String code) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final repo = ref.watch(productRepoProvider);
      final result = await repo.fetchStock(code);

      Logger.i(result);

      return result.fold((l) {
        showErrorToast(l.error.message);
        return [];
      }, (r) => r);
    });
  }
}
