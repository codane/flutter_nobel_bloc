import 'dart:convert';

import 'package:flutter_nobel/data/data_source/remote/dto/motivation_dto.dart';
import 'package:flutter_nobel/domain/model/motivation_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testMotivationDto = MotivationDto(en: "Test motivation");

  test(
    'should be a subclass of MotivationModel',
    () => expect(
      testMotivationDto,
      isA<MotivationModel>(),
    ),
  );

  test('should return a valid MotivationDto', () async {

    final Map<String,dynamic> map = json.decode(fixture('motivation.json'));

    final result = MotivationDto.fromMap(map);

    expect(result, testMotivationDto);
  });
}
