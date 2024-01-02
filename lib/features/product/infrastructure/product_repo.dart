import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../../core/core.dart';
import '../../../features/product/domain/category_wise_product_list.dart';
import '../../../features/product/domain/model/product_stock_model.dart';
import '../../../features/product/domain/product_response.dart';
import '../../../features/product/domain/similar_product_response.dart';
import '../domain/get_all_product_list.dart';

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

  Future<Either<CleanFailure, GetAllProductResponse>> getAllProduct({
    required int page,
  }) async {
    final data = await api.get(
      fromData: (json) => GetAllProductResponse.fromMap(json),
      endPoint: "${APIRouteEndpoint.GET_ALL_PRODUCT}?page=$page",
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
    Clipboard.setData(
            ClipboardData(text: "https://iconshopper.com/products/$slug"))
        .then((value) {
      // Show a toast message after copying to the clipboard
      BotToast.showText(text: "URL copied to clipboard");
    });
  }

  Future<Either<CleanFailure, List<ProductStockModel>>> fetchStock(
      String variationCode) async {
    final uri = Uri.parse(
        "${APIRouteEndpoint.BASE_URL}${APIRouteEndpoint.PRODUCT_STOCK}$variationCode");

    Logger.d(uri);

    final response = await http.get(
      uri,
      headers: {"Accept": "application/json"},
    );

    Logger.d(response.body);
    Logger.d(response.statusCode);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      // Decode the JSON response
      List<dynamic> data = json.decode(response.body);
      Logger.i(data);

      // Convert the decoded data into a list of Post objects
      List<ProductStockModel> postList =
          data.map((item) => ProductStockModel.fromMap(item)).toList();
      Logger.i(postList);

      return right(postList);
    } else {
      Logger.e(response.body);
      throw left(
        CleanFailure(
          error: const CleanError(message: "Failed to load post"),
          tag: "${APIRouteEndpoint.PRODUCT_STOCK}$variationCode",
        ),
      );
    }
  }
}
