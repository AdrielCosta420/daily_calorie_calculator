abstract interface class ApiRequest {
  Future<Map<String, dynamic>> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  });

}