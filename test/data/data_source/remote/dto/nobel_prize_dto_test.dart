import 'package:flutter_nobel/data/data_source/remote/dto/nobel_prize_dto.dart';
import 'package:flutter_nobel/domain/model/nobel_prize_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testNobelPrizeDto = NobelPrizeDto();

  test(
    'should be a subclass of NobelPrizeModel',
    () => expect(
      testNobelPrizeDto,
      isA<NobelPrizeModel>(),
    ),
  );
}
