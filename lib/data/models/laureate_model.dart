import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_nobel/data/models/birth_model.dart';
import 'package:flutter_nobel/data/models/full_name_model.dart';
import 'package:flutter_nobel/data/models/nobel_prize_model.dart';
import 'package:flutter_nobel/data/models/wikipedia_model.dart';

class LaureateModel {
  final String? id;
  final FullNameModel? fullName;
  final String? gender;
  final BirthModel? birth;
  final WikipediaModel? wikipedia;
  final List<NobelPrizeModel>? nobelPrizes;
  
  LaureateModel({
    this.id,
    this.fullName,
    this.gender,
    this.birth,
    this.wikipedia,
    this.nobelPrizes,
  });

  

  LaureateModel copyWith({
    String? id,
    FullNameModel? fullName,
    String? gender,
    BirthModel? birth,
    WikipediaModel? wikipedia,
    List<NobelPrizeModel>? nobelPrizes,
  }) {
    return LaureateModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      birth: birth ?? this.birth,
      wikipedia: wikipedia ?? this.wikipedia,
      nobelPrizes: nobelPrizes ?? this.nobelPrizes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName?.toMap(),
      'gender': gender,
      'birth': birth?.toMap(),
      'wikipedia': wikipedia?.toMap(),
      'nobelPrizes': nobelPrizes?.map((x) => x.toMap()).toList(),
    };
  }

  factory LaureateModel.fromMap(Map<String, dynamic> map) {
    return LaureateModel(
      id: map['id'],
      fullName: map['fullName'] != null ? FullNameModel.fromMap(map['fullName']) : null,
      gender: map['gender'],
      birth: map['birth'] != null ? BirthModel.fromMap(map['birth']) : null,
      wikipedia: map['wikipedia'] != null ? WikipediaModel.fromMap(map['wikipedia']) : null,
      nobelPrizes: map['nobelPrizes'] != null ? List<NobelPrizeModel>.from(map['nobelPrizes']?.map((x) => NobelPrizeModel.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LaureateModel.fromJson(String source) => LaureateModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LaureateModel(id: $id, fullName: $fullName, gender: $gender, birth: $birth, wikipedia: $wikipedia, nobelPrizes: $nobelPrizes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LaureateModel &&
      other.id == id &&
      other.fullName == fullName &&
      other.gender == gender &&
      other.birth == birth &&
      other.wikipedia == wikipedia &&
      listEquals(other.nobelPrizes, nobelPrizes);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      fullName.hashCode ^
      gender.hashCode ^
      birth.hashCode ^
      wikipedia.hashCode ^
      nobelPrizes.hashCode;
  }
}
