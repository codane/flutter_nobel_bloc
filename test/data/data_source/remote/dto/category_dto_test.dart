import 'package:flutter_nobel/data/data_source/remote/dto/category_dto.dart';
import 'package:flutter_nobel/domain/model/category_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testCategoryDto = CategoryDto();

  test(
    'should be a subclass of CategoryModel',
    () async => expect(
      testCategoryDto,
      isA<CategoryModel>(),
    ),
  );
}
