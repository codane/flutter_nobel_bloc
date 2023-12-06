import 'dart:convert';

import 'package:flutter_nobel/data/data_source/remote/dto/category_dto.dart';
import 'package:flutter_nobel/domain/model/category_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testCategoryDto = CategoryDto(en: "Test category");

  test(
    'should be a subclass of CategoryModel',
    () async => expect(
      testCategoryDto,
      isA<CategoryModel>(),
    ),
  );

  test('should return a valid CategoryDto', () async {

    final Map<String, dynamic> map = json.decode(fixture('category.json'));

    final result = CategoryDto.fromMap(map);

    expect(result, testCategoryDto);
  });
}
