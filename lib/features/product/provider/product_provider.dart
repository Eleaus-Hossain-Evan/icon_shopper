import 'dart:async';

import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/product/domain/model/product_model.dart';
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
