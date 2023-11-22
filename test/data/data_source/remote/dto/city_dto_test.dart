import 'package:flutter_nobel/data/data_source/remote/dto/city_dto.dart';
import 'package:flutter_nobel/domain/model/city_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testCityDto = CityDto();

  test(
    'should be a subclass of CityModel',
    () async => expect(
      testCityDto,
      isA<CityModel>(),
    ),
  );
}
