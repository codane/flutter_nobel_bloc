import 'package:flutter_nobel/data/data_source/remote/dto/country_dto.dart';
import 'package:flutter_nobel/domain/model/country_model.dart';

CountryModel toCountryModel(CountryDto dto) => CountryModel(
  en: dto.en,
);