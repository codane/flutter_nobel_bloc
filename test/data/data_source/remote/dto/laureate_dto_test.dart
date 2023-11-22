import 'package:flutter_nobel/data/data_source/remote/dto/laureate_dto.dart';
import 'package:flutter_nobel/domain/model/laureate_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testLaureateDto = LaureateDto();

  test(
    'should be a subclass of LaureateModel',
    () => expect(
      testLaureateDto,
      isA<LaureateModel>(),
    ),
  );
}
