import 'dart:convert';

import 'package:flutter_nobel/data/data_source/remote/dto/wikipedia_dto.dart';
import 'package:flutter_nobel/domain/model/wikipedia_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testWikipediaDto = WikipediaDto(english: "Test");

  test(
    'should be a subclass of WikipediaModel',
    () => expect(
      testWikipediaDto,
      isA<WikipediaModel>(),
    ),
  );

  test('should return a valid WikipediaDto', () async {

    final Map<String, dynamic> map = json.decode(fixture('wikipedia.json'));

    final result = WikipediaDto.fromMap(map);

    expect(result, testWikipediaDto);
  });
}
