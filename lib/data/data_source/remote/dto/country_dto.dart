import 'package:flutter_nobel/domain/model/country_model.dart';

class CountryDto extends CountryModel {
  const CountryDto({
    String? en,
  }) : super(en: en);

  factory CountryDto.fromMap(Map<String, dynamic> map) => CountryDto(
        en: map['en'],
      );
}
