import 'package:flutter_nobel/data/data_source/remote/dto/motivation_dto.dart';
import 'package:flutter_nobel/domain/model/motivation_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testMotivationDto = MotivationDto();

  test(
    'should be a subclass of MotivationModel',
    () => expect(
      testMotivationDto,
      isA<MotivationModel>(),
    ),
  );
}
