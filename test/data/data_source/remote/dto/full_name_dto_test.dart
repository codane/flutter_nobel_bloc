import 'package:flutter_nobel/data/data_source/remote/dto/full_name_dto.dart';
import 'package:flutter_nobel/domain/model/full_name_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testFullNameDto = FullNameDto();

  test(
    'should be a subclass of FullNameModel',
    () => expect(
      testFullNameDto,
      isA<FullNameModel>(),
    ),
  );
}
