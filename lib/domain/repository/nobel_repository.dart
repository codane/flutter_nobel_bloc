import 'package:flutter_nobel/domain/model/laureate_model.dart';

abstract interface class NobelRepository {
  
  Future<List<LaureateModel>> getLaureatesByCategory({
    required int apiOffset,
    required String categoryAbbreviation,
    }
  );
}
