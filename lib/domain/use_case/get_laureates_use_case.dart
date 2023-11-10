import 'package:flutter_nobel/data/repository/nobel_repository_impl.dart';
import 'package:flutter_nobel/domain/model/laureate_model.dart';
import 'package:flutter_nobel/domain/repository/nobel_repository.dart';

class GetLaureatesUseCase {
  final NobelRepository repository = NobelRepositoryImpl();

  
  Future<List<LaureateModel>> call(
          {required int apiOffset, required String categoryAbbreviation}) =>
      repository.getLaureatesByCategory(
          apiOffset: apiOffset, categoryAbbreviation: categoryAbbreviation);
}
