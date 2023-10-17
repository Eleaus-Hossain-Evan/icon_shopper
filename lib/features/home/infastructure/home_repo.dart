import '../../../core/core.dart';
import '../domain/home_reponse.dart';

class HomeRepo {
  final api = NetworkHandler.instance;

  Future<Either<CleanFailure, HomeResponse>> getHomeData() async {
    final data = await api.get(
      fromData: (json) => HomeResponse.fromMap(json),
      endPoint: APIRoute.HOME,
      withToken: true,
    );

    return data;
  }
}
