import 'package:dio/dio.dart';
import 'package:flutter_nobel/data/data_providers/nobel_api_data_provider.dart';
import 'package:flutter_nobel/data/models/laureate_model.dart';
import 'package:flutter_nobel/data/network/dio_exceptions.dart';

final class NobelRepository {
  final NobelApiDataProvider dataProvider = NobelApiDataProvider();


  // convert raw data into a list of Laureate models
  Future<List<LaureateModel>> getApiData({required int apiOffset, required String categoryAbbreviation}) async {
    try {
      final apiResponse = await dataProvider.getApiData(apiOffset: apiOffset, categoryAbbreviation: categoryAbbreviation);
      final laureatesList = (apiResponse.data['laureates'] as List).map((laureate) => LaureateModel.fromMap(laureate)).toList();
      return laureatesList;
      
    } on DioException catch (e) {
      final exceptionMessage = DioExceptions.fromDioException(e).toString();
      throw exceptionMessage;
    } 
  }
}