import 'package:dio/dio.dart';
import 'package:flutter_nobel/common/constants/nobel_api_constants.dart';
import 'package:flutter_nobel/common/dio_exceptions.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/laureate_dto.dart';

class NobelApiDataSource {
  final Dio dio;

  const NobelApiDataSource({
    required this.dio,
  });

  Future<List<LaureateDto>> getLaureatesByCategory(
      {required int apiOffset, required String categoryAbbreviation}) async {
    try {
      final Response apiResponse = await dio.get(
        NobelApiConstants.laureatesUrlPath,
        queryParameters: {
          'offset': apiOffset,
          'limit': NobelApiConstants.nobelApiLimit,
          'nobelPrizeCategory': categoryAbbreviation
        },
      );
      final laureates = (apiResponse.data['laureates'] as List)
          .map((e) => LaureateDto.fromMap(e))
          .toList();
      return laureates;
    } on DioException catch (e) {
      throw DioExceptions.fromDioException(e).toString();
    }
  }
}
