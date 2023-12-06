import 'dart:convert';

import 'package:flutter_nobel/data/data_source/remote/dto/birth_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/city_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/country_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/full_name_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/laureate_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/nobel_prize_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/place_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/wikipedia_dto.dart';
import 'package:flutter_nobel/domain/model/laureate_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testLaureateDto = LaureateDto(
    id: "Test id",
    fullName: FullNameDto(en: "Test laureate full name"),
    gender: "Test gender",
    birth: BirthDto(date: "Test laureate date", place: PlaceDto(city: CityDto(), country: CountryDto())),
    wikipedia: WikipediaDto(english: "Test laureate wikipedia"),
    nobelPrizes: [NobelPrizeDto(), NobelPrizeDto()],
  );

  test(
    'should be a subclass of LaureateModel',
    () => expect(
      testLaureateDto,
      isA<LaureateModel>(),
    ),
  );

  test('should return a valid LaureateDto', () async {
    final Map<String, dynamic> map = json.decode(fixture('laureate.json'));

    final result = LaureateDto.fromMap(map);

    expect(result, testLaureateDto);
  });
}
