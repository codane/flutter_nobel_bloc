import 'dart:convert';

import 'package:flutter_nobel/data/data_source/remote/dto/full_name_dto.dart';
import 'package:flutter_nobel/domain/model/full_name_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testFullNameDto = FullNameDto(en: "Test full name");

  test(
    'should be a subclass of FullNameModel',
    () => expect(
      testFullNameDto,
      isA<FullNameModel>(),
    ),
  );

  test('should return a valid FullNameDto', () async {

    final Map<String, dynamic> map = json.decode(fixture('full_name.json'));

    final result = FullNameDto.fromMap(map);

    expect(result, testFullNameDto);
  });
}
