import 'package:icon_shopper/features/product/domain/category_wise_product_list.dart';

import '../../../core/core.dart';

class ProductRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, CategoryWiseProductResponse>> categoryWiseProduct(
      {required String slug, required int page,}) async {
    final data = await api.get(
      fromData: (json) => CategoryWiseProductResponse.fromMap(json),
      endPoint: "${APIRoute.CATEGORY_WISE_PRODUCT}$slug?page=$page",
      withToken: true,
    );

    return data;
  }
}
