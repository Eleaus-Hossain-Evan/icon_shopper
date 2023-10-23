import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/product/domain/model/product_model.dart';
import 'package:icon_shopper/features/product/domain/product_response.dart';
import 'package:icon_shopper/features/product/infrastructure/product_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

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

@riverpod
class ProductDetails extends _$ProductDetails {
  @override
  FutureOr<ProductResponse> build(String slug) async {
    final result = await ProductRepo().getProductDetails(slug);
    return result.fold((l) {
      return showErrorToast(l.error.message);
    }, (r) => r);
  }
}

final productProvider =
    NotifierProviderFamily<ProductNotifier, Future<ProductResponse>, String>(
        ProductNotifier.new);

class ProductNotifier extends FamilyNotifier<Future<ProductResponse>, String> {
  @override
  Future<ProductResponse> build(String slug) async {
    final result = await ProductRepo().getProductDetails(slug);
    return result.fold((l) {
      return showErrorToast(l.error.message);
    }, (r) => r);
  }
}
