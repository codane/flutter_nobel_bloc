import 'dart:convert';

import 'package:flutter_nobel/data/models/place_model.dart';

class BirthModel {
  final String? date;
  final PlaceModel? place;
  
  BirthModel({
    this.date,
    this.place,
  });

  BirthModel copyWith({
    String? date,
    PlaceModel? place,
  }) {
    return BirthModel(
      date: date ?? this.date,
      place: place ?? this.place,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'place': place?.toMap(),
    };
  }

  factory BirthModel.fromMap(Map<String, dynamic> map) {
    return BirthModel(
      date: map['date'],
      place: map['place'] != null ? PlaceModel.fromMap(map['place']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BirthModel.fromJson(String source) => BirthModel.fromMap(json.decode(source));

  @override
  String toString() => 'BirthModel(date: $date, place: $place)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BirthModel &&
      other.date == date &&
      other.place == place;
  }

  @override
  int get hashCode => date.hashCode ^ place.hashCode;
}
