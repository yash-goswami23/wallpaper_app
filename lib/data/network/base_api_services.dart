import 'package:either_dart/either.dart';

import '../../model/wallpaper.dart';

abstract class BaseApiServices {
  Future<Either<ServerError, Data>> getApiResponse(String url, String apiKey);
}
