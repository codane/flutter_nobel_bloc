import 'dart:convert';

import 'package:flutter_nobel/data/data_source/remote/dto/city_dto.dart';
import 'package:flutter_nobel/domain/model/city_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testCityDto = CityDto(en: "Test city");

  test(
    'should be a subclass of CityModel',
    () async => expect(
      testCityDto,
      isA<CityModel>(),
    ),
  );

  test('should return a valid CityDto', () async {

    final Map<String, dynamic> map = json.decode(fixture('city.json'));

    final result = CityDto.fromMap(map);

    expect(result, testCityDto);
  });
}
