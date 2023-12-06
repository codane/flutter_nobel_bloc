import 'dart:convert';

import 'package:flutter_nobel/data/data_source/remote/dto/laureate_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/nobel_response_dto.dart';
import 'package:flutter_nobel/domain/model/nobel_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testNobelResponseDto = NobelResponseDto(laureates: [LaureateDto(), LaureateDto()]);

  test(
    'should be a subclass of NobelResponseModel',
    () => expect(
      testNobelResponseDto,
      isA<NobelResponseModel>(),
    ),
  );

  test('should return a valid NobelResponseDto', () async {

    final Map<String,dynamic> map = json.decode(fixture('nobel_response.json'));

    final result = NobelResponseDto.fromMap(map);

    expect(result, testNobelResponseDto);

  });
}
