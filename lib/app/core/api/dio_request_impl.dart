import 'package:daily_calorie_calculator/app/core/api/api_request.dart';
import 'package:daily_calorie_calculator/app/core/constants/constants.dart';
import 'package:dio/dio.dart';

class DioRequestImpl implements ApiRequest {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      baseUrl: Constants.kBaseUrl,
    ),
  );

  
  @override
  Future<Map<String, dynamic>> get({required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);

      return response.data;
    } on DioException catch (e) {
      throw 'Erro de requisição. ${e.message} ${e.stackTrace}';
    } on Exception catch (error) {
      throw Exception(error);
    }
  }
}
