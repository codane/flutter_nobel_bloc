import 'package:equatable/equatable.dart';
import 'package:flutter_nobel/domain/model/city_model.dart';
import 'package:flutter_nobel/domain/model/country_model.dart';

class PlaceModel extends Equatable {
  final CityModel? city;
  final CountryModel? country;

  const PlaceModel({
    this.city,
    this.country,
  });

  @override
  List<Object?> get props => [city, country];
}
