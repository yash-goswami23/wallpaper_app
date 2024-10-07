import 'package:http/http.dart';

class Wallpaper {
  String imgSrc;
  String nextPageUrl;
  String prevPageUrl;
  Wallpaper(
      {required this.imgSrc, this.nextPageUrl = "", this.prevPageUrl = ""});
}

class Data {
  final Response data;
  Data(this.data);
}

class ServerError {
  final String message;
  ServerError(this.message);
}
