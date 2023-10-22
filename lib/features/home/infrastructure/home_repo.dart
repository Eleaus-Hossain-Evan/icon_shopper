import '../../../core/core.dart';
import '../domain/home_response.dart';
import '../domain/paginated_product_response.dart';

class HomeRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, HomeResponse>> getHomeData() async {
    final data = await api.get(
      fromData: (json) => HomeResponse.fromMap(json),
      endPoint: APIRouteEndpoint.HOME,
      withToken: true,
    );

    return data;
  }

  Future<Either<CleanFailure, PaginatedProductResponse>> searchProduct(
    String query, {
    int page = 1,
  }) async {
    final data = await api.get(
      fromData: (json) => PaginatedProductResponse.fromMap(json),
      endPoint: "${APIRouteEndpoint.SEARCH}$query?page=$page",
      withToken: true,
    );

    return data;
  }
}
