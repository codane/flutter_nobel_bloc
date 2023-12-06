import 'dart:convert';

import 'package:flutter_nobel/data/data_source/remote/dto/category_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/motivation_dto.dart';
import 'package:flutter_nobel/data/data_source/remote/dto/nobel_prize_dto.dart';
import 'package:flutter_nobel/domain/model/nobel_prize_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const testNobelPrizeDto = NobelPrizeDto(
    awardYear: "Test year",
    category: CategoryDto(en: "Test prize category"),
    prizeStatus: "Test prize status",
    motivation: MotivationDto(en: "Test prize motivation"),
    prizeAmount: 100
  );

  test(
    'should be a subclass of NobelPrizeModel',
    () => expect(
      testNobelPrizeDto,
      isA<NobelPrizeModel>(),
    ),
  );

  test('should return a valid NobelPrizeDto', () async {
    final Map<String, dynamic> map = json.decode(fixture('nobel_prize.json'));

    final result = NobelPrizeDto.fromMap(map);

    expect(result, testNobelPrizeDto);
  });
}
