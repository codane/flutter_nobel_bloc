import 'package:flutter_nobel/data/data_source/remote/nobel_api_data_source.dart';
import 'package:flutter_nobel/domain/model/laureate_model.dart';
import 'package:flutter_nobel/domain/repository/nobel_repository.dart';
import 'package:flutter_nobel/data/data_source/mapper/laureate_mapper.dart';

final class NobelRepositoryImpl implements NobelRepository {
  final NobelApiDataSource nobelApiSource;

  const NobelRepositoryImpl({
    required this.nobelApiSource
  });

  @override
  Future<List<LaureateModel>> getLaureatesByCategory({
    required int apiOffset,
    required String categoryAbbreviation,
  }) async {
    final response = await nobelApiSource.getLaureatesByCategory(
        apiOffset: apiOffset, categoryAbbreviation: categoryAbbreviation);
    final laureateModels = response.map((e) => toLaureateModel(e)).toList();
    return laureateModels;
  }
}
