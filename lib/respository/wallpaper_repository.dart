import 'package:either_dart/either.dart';
import 'package:wallpaper/data/network/base_api_services.dart';
import 'package:wallpaper/data/network/network_api_service.dart';
import 'package:wallpaper/model/wallpaper.dart';
import 'package:wallpaper/res/app_url.dart';

class WallpaperRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  Future<Either<ServerError, Data>> getApiData(String url) async {
    Future<Either<ServerError, Data>> value =
        _apiServices.getApiResponse(url, AppUrl.apiKey);
    return value;
  }
}
