import 'dart:async';

import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/product/domain/model/product_model.dart';
import 'package:icon_shopper/features/product/domain/model/product_variant_model.dart';
import 'package:icon_shopper/features/product/domain/product_response.dart';
import 'package:icon_shopper/features/product/infrastructure/product_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/model/product_stock_model.dart';

part 'product_provider.g.dart';

final productTitleOverflow = StateProvider<bool>((ref) {
  return false;
}, name: 'productTitleOverflow');

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

final slugProvider = StateProvider<String>((ref) {
  return '';
});

// @riverpod
// class GetProductDetails extends _$GetProductDetails {
//   @override
//   FutureOr<ProductResponse> build(String slug) async {
//     final result = await ProductRepo().getProductDetails(slug);
//     return result.fold((l) {
//       showErrorToast(l.error.message);
//       return ProductResponse.init();
//     }, (r) => r);
//   }
// }

final getProductDetailsProvider = FutureProvider<ProductResponse>((ref) async {
  final slug = ref.watch(slugProvider);
  final result = await ProductRepo().getProductDetails(slug);
  return result.fold((l) {
    showErrorToast(l.error.message);
    return ProductResponse.init();
  }, (r) => r);
}, name: 'getProductDetailsProvider');

// @Riverpod(keepAlive: true)
// class CurrentProduct extends _$CurrentProduct {
//   @override
//   ProductModel build() {
//     return ProductModel.init();
//   }

//   void setState(ProductModel model) async {
//     state = model;
//     ref.read(productVariantProvider.notifier).update((v) {
//       if (model.productVariationStatus == 1) {
//         return model.productVariants.first;
//       }
//       return v;
//     });
//   }

//   void setVariant(ProductVariantModel item) {
//     final model = state.copyWith(selectedVariant: item);

//     Logger.i(model);
//     state = model;
//   }

//   // void setVariation(ProductVariantModel model) {
//   //   ref.read(productVariantProvider.notifier).update((v) => model);
//   // }
// }

final productVariantProvider =
    StateProvider.autoDispose<ProductVariantModel>((ref) {
  final state = ref.watch(productNotifierProvider);

  final variant = state.productVariants.isNotEmpty
      ? state.productVariants[0]
      : ProductVariantModel.init();

  return variant;
}, name: 'productVariantProvider');

// final productNotifierProvider = NotifierProvider<ProductNotifier, ProductModel>(
//   ProductNotifier.new,
//   name: 'productNotifierProvider',
// );

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

final similarProductProvider =
    FutureProvider.autoDispose<List<ProductModel>>((ref) async {
  final state = ref.watch(productNotifierProvider);
  final result = await ref.read(productRepoProvider).similarProduct(state.id);
  return result.fold((l) {
    showErrorToast(l.error.message);
    return [];
  }, (r) => r.data);
}, name: 'similarProductProvider');

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
