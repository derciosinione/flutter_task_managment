class GenericResponse<T> {
  final T? data;
  final bool success;
  final String? error;
  final int statusCode;

  GenericResponse({
    required this.data,
    required this.success,
    required this.statusCode,
    this.error,
  });

  factory GenericResponse.success(T data) {
    return GenericResponse(data: data, success: true, statusCode: 200);
  }

  factory GenericResponse.failure(String error, int statusCode) {
    return GenericResponse(
        data: null, success: false, statusCode: statusCode, error: error);
  }
}
