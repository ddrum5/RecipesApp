import 'dart:io';
import 'package:http/http.dart';
import 'package:project_pilot/network/request_type.dart';


class Networking {
  final Client _client;

  Networking(this._client);

  Future<Response> request(
      {required String path,
      required RequestType type}) async {
    switch (type) {
      case RequestType.GET:
        return _client.get(Uri.parse(path));
      default:
        return throw HttpException("Not Type");
    }
  }
}
