import 'package:flutter_nobel/data/data_source/remote/dto/place_dto.dart';
import 'package:flutter_nobel/domain/model/place_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testPlaceDto = PlaceDto();

  test(
    'should be a subclass of PlaceModel',
    () => expect(
      testPlaceDto,
      isA<PlaceModel>(),
    ),
  );
}
