import 'package:flutter_nobel/domain/model/laureate_model.dart';
import 'package:flutter_nobel/domain/repository/nobel_repository.dart';

final class GetLaureatesUseCase {
  final NobelRepository repository;

  const GetLaureatesUseCase({
    required this.repository
  });

  Future<List<LaureateModel>> call(
          {required int apiOffset, required String categoryAbbreviation}) =>
      repository.getLaureatesByCategory(
          apiOffset: apiOffset, categoryAbbreviation: categoryAbbreviation);
}
