import 'package:either_dart/either.dart';
import 'package:wallpaper/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
import '../../model/wallpaper.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future<Either<ServerError, Data>> getApiResponse(
      String url, String apiKey) async {
    try {
      final value = await http.get(Uri.parse(url), headers: {
        'Authorization': apiKey
      }).timeout(const Duration(seconds: 10));
      return Right(Data(value));
    } catch (e) {
      return Left(ServerError("Internet Problem Restart The App"));
    }
  }
}
