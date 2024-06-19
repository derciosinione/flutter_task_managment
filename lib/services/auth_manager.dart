import 'dart:convert';

import 'package:wb/services/http/client/dio_client.dart';
import 'package:wb/services/http/exceptions/app_http_exception.dart';
import 'package:wb/services/utils/storage_service.dart';

import '../url/routes_url.dart';

class AuthManager {
  Future<dynamic> login(String username, String password) async {
    var url = Uri.parse(UserUrl.login);
    final headers = {
      'Content-Type': 'application/json',
    };

    var body = {"username": username, "password": password};

    final response =
        await client.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      AppStorage.save("id", responseJson["id"]);
      AppStorage.save("token", responseJson["token"]);
      return responseJson;
    }

    ExceptionValidation.throwHttpError(response);
  }

  Future<dynamic> logout() async {
    var url = Uri.parse(UserUrl.logout);
    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await client.post(url, headers: headers);

    if (response.statusCode == 200) {
      AppStorage.save("token", "");
      return;
    }

    ExceptionValidation.throwHttpError(response);
  }
}
