import 'package:flutter_nobel/data/data_source/remote/dto/country_dto.dart';
import 'package:flutter_nobel/domain/model/country_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testCountryDto = CountryDto();

  test(
    'should be a subclass of CountryModel',
    () => expect(
      testCountryDto,
      isA<CountryModel>(),
    ),
  );
}
