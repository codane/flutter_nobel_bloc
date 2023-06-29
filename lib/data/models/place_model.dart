import 'dart:convert';

import 'package:flutter_nobel/data/models/city_model.dart';
import 'package:flutter_nobel/data/models/country_model.dart';

class PlaceModel {
  final CityModel? city;
  final CountryModel? country;
  
  PlaceModel({
    this.city,
    this.country,
  });

  PlaceModel copyWith({
    CityModel? city,
    CountryModel? country,
  }) {
    return PlaceModel(
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city?.toMap(),
      'country': country?.toMap(),
    };
  }

  factory PlaceModel.fromMap(Map<String, dynamic> map) {
    return PlaceModel(
      city: map['city'] != null ? CityModel.fromMap(map['city']) : null,
      country: map['country'] != null ? CountryModel.fromMap(map['country']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceModel.fromJson(String source) => PlaceModel.fromMap(json.decode(source));

  @override
  String toString() => 'PlaceModel(city: $city, country: $country)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PlaceModel &&
      other.city == city &&
      other.country == country;
  }

  @override
  int get hashCode => city.hashCode ^ country.hashCode;
}
