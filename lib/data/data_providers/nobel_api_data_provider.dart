import 'package:dio/dio.dart';
import 'package:flutter_nobel/data/network/nobel_api_constants.dart';

class NobelApiDataProvider {
  final Dio _dio;

  NobelApiDataProvider()
      : _dio = Dio(BaseOptions(baseUrl: NobelApiConstants.baseUrl));

  Future<Response> getApiData(
      {required int apiOffset, required String categoryAbbreviation}) async {
    try {
      final Response apiResponse = await _dio.get(
        NobelApiConstants.laureatesUrlPath,
        queryParameters: {
          'offset': apiOffset,
          'limit': NobelApiConstants.nobelApiLimit,
          'nobelPrizeCategory': categoryAbbreviation
        },
      );
      return apiResponse;
    
    } catch (e) {
      rethrow;
    }
  }
}
