import 'dart:convert';

import 'package:flutter_nobel/data/data_source/remote/dto/birth_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/city_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/country_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/place_dto.dart';
import 'package:flutter_nobel/domain/model/birth_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testBirthDto = BirthDto(
      date: "Test date",
      place: PlaceDto(
          city: CityDto(en: "Test birth city"),
          country: CountryDto(en: "Test birth country")));

  test(
    'should be a subclass of BirthModel',
    () async => expect(
      testBirthDto,
      isA<BirthModel>(),
    ),
  );

  test('should return a valid BirthDto', () async {
    final Map<String, dynamic> map = json.decode(fixture('birth.json'));

    final result = BirthDto.fromMap(map);

    expect(result, testBirthDto);
  });
}
