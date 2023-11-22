import 'package:flutter_nobel/data/data_source/remote/dto/birth_dto.dart';
import 'package:flutter_nobel/domain/model/birth_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testBirthDto = BirthDto();

  test(
    'should be a subclass of BirthModel',
    () async => expect(
      testBirthDto,
      isA<BirthModel>(),
    ),
  );
}
