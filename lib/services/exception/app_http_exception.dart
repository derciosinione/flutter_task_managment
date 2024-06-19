import 'dart:convert';
import 'package:http/http.dart' as http;

class AppHttpException implements Exception {
  final String message;
  AppHttpException(this.message);
}

class ExceptionValidation {
  static void throwHttpError(http.Response response) {
    throw AppHttpException(_getMessage(response));
  }

  static _getMessage(http.Response response) {
    switch(response.statusCode){
      case 400:
        return jsonEncode(_errorResponse("Bad Request", jsonDecode(response.body)[0]['message']));
      case 401:
        return jsonEncode(_errorResponse(
            "Invalid Credentials", jsonDecode(response.body)['message']));
      case 404:
        return jsonEncode(_errorResponse("Not Found", response.body));
      case 500:
        return jsonEncode(_errorResponse(
            "Error occured while Communication with Server", response.body));
      default:
        return "${response.statusCode} error detected";
    }
  }

  static Map<String, String> _errorResponse(String title, String body) =>
      {"title": title, "error": body};

  static String _badRequestMessages(http.Response response) {
    if (response.statusCode == 400) {
      var result = jsonDecode(response.body);
      var errors = result['errors'];
      var errorMessage = "";

      for (var key in errors.keys) {
        errorMessage +=
        "${errors[key]!.map((msg) => "$key: $msg").first};\n";
      }
      return errorMessage;
    }
    return "";
  }
}
