import 'package:arquitetura_flutter/app/interfaces/client_http_interface.dart';
import 'package:dio/dio.dart';

class ClientHttpService implements ClientHttpInterface {

  final Dio dio = Dio();

  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    var response = await dio.get(url);
    return response.data;
  }
}
