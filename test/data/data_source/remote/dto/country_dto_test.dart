import 'dart:convert';

import 'package:flutter_nobel/data/data_source/remote/dto/country_dto.dart';
import 'package:flutter_nobel/domain/model/country_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testCountryDto = CountryDto(en: "Test country");

  test(
    'should be a subclass of CountryModel',
    () => expect(
      testCountryDto,
      isA<CountryModel>(),
    ),
  );

  test('should return a valid CountryDto', () async {

    final Map<String, dynamic> map = json.decode(fixture('country.json'));

    final result = CountryDto.fromMap(map);

    expect(result, testCountryDto);
  });
}
