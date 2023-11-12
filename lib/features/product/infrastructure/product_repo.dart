import 'package:bot_toast/bot_toast.dart';
import 'package:clipboard/clipboard.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/product/domain/category_wise_product_list.dart';
import 'package:icon_shopper/features/product/domain/product_response.dart';
import 'package:icon_shopper/features/product/domain/similar_product_response.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/core.dart';

final productRepoProvider = Provider<ProductRepo>((ref) {
  return ProductRepo();
});

class ProductRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, CategoryWiseProductResponse>>
      categoryWiseProduct({
    required String slug,
    required int page,
  }) async {
    final data = await api.get(
      fromData: (json) => CategoryWiseProductResponse.fromMap(json),
      endPoint: "${APIRouteEndpoint.CATEGORY_WISE_PRODUCT}$slug?page=$page",
      withToken: true,
    );

    return data;
  }

  Future<Either<CleanFailure, ProductResponse>> getProductDetails(
    String slug,
  ) async {
    final data = await api.get(
      fromData: (json) => ProductResponse.fromMap(json),
      endPoint: APIRouteEndpoint.PRODUCT_DETAILS + slug,
      withToken: true,
    );

    return data;
  }

  Future<Either<CleanFailure, SimilarProductResponse>> similarProduct(
    int id,
  ) async {
    final data = await api.get(
      fromData: (json) => SimilarProductResponse.fromMap(json),
      endPoint: "${APIRouteEndpoint.SIMILAR_PRODUCT}$id",
      withToken: true,
    );

    return data;
  }

  Future<void> shareOnFacebook(String urlToShare) async {
    final String facebookUrl =
        'https://www.facebook.com/sharer/sharer.php?u=$urlToShare';

    if (await canLaunchUrl(Uri.parse(facebookUrl))) {
      await launchUrl(Uri.parse(facebookUrl));
    } else {
      throw 'Could not launch $facebookUrl';
    }
  }

  void copyProductUrl(String slug) {
    FlutterClipboard.copy("https://iconshopper.com/products/$slug")
        .then((value) {
      // Show a toast message after copying to the clipboard
      BotToast.showText(text: "URL copied to clipboard");
    });
  }
}
