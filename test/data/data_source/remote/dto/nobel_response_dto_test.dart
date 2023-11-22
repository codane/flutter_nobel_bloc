import 'package:flutter_nobel/data/data_source/remote/dto/nobel_response_dto.dart';
import 'package:flutter_nobel/domain/model/nobel_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testNobelResponseDto = NobelResponseDto();

  test(
    'should be a subclass of NobelResponseModel',
    () => expect(
      testNobelResponseDto,
      isA<NobelResponseModel>(),
    ),
  );
}
