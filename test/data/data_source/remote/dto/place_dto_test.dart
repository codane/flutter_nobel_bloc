import 'dart:convert';

import 'package:flutter_nobel/data/data_source/remote/dto/city_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/country_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/place_dto.dart';
import 'package:flutter_nobel/domain/model/place_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testPlaceDto = PlaceDto(
    city: CityDto(en: "Place city"),
    country: CountryDto(en: "Place country"),
  );

  test(
    'should be a subclass of PlaceModel',
    () => expect(
      testPlaceDto,
      isA<PlaceModel>(),
    ),
  );

  test('should return a valid PlaceDto', () async {
    final Map<String, dynamic> map = json.decode(fixture('place.json'));

    final result = PlaceDto.fromMap(map);

    expect(result, testPlaceDto);
  });
}
