import 'dart:convert';

class AppHttpException implements Exception {
  final String message;
  AppHttpException(this.message);
}

class ExceptionValidation {
  static void throwHttpError(int statusCode, String message) {
    throw AppHttpException(_getMessage(statusCode, message));
  }

  static _getMessage(int statusCode, String message) {
    switch (statusCode) {
      case 400:
        return jsonEncode(_errorResponse("Bad Request", message));
      case 401:
        return jsonEncode(_errorResponse("Invalid Credentials", message));
      case 404:
        return jsonEncode(_errorResponse("Not Found", message));
      case 500:
        return jsonEncode(_errorResponse(
            "Error occured while Communication with Server", message));
      default:
        return "$statusCode error detected";
    }
  }

  static Map<String, String> _errorResponse(String title, String body) =>
      {"title": title, "error": body};
}
