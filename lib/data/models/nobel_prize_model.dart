import 'dart:convert';

import 'package:flutter_nobel/data/models/category_model.dart';
import 'package:flutter_nobel/data/models/motivation_model.dart';

class NobelPrizeModel {
  final String? awardYear;
  final CategoryModel? category;
  final String? prizeStatus;
  final MotivationModel? motivation;
  final int? prizeAmount;
  
  NobelPrizeModel({
    this.awardYear,
    this.category,
    this.prizeStatus,
    this.motivation,
    this.prizeAmount,
  });


  NobelPrizeModel copyWith({
    String? awardYear,
    CategoryModel? category,
    String? prizeStatus,
    MotivationModel? motivation,
    int? prizeAmount,
  }) {
    return NobelPrizeModel(
      awardYear: awardYear ?? this.awardYear,
      category: category ?? this.category,
      prizeStatus: prizeStatus ?? this.prizeStatus,
      motivation: motivation ?? this.motivation,
      prizeAmount: prizeAmount ?? this.prizeAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'awardYear': awardYear,
      'category': category?.toMap(),
      'prizeStatus': prizeStatus,
      'motivation': motivation?.toMap(),
      'prizeAmount': prizeAmount,
    };
  }

  factory NobelPrizeModel.fromMap(Map<String, dynamic> map) {
    return NobelPrizeModel(
      awardYear: map['awardYear'],
      category: map['category'] != null ? CategoryModel.fromMap(map['category']) : null,
      prizeStatus: map['prizeStatus'],
      motivation: map['motivation'] != null ? MotivationModel.fromMap(map['motivation']) : null,
      prizeAmount: map['prizeAmount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NobelPrizeModel.fromJson(String source) => NobelPrizeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NobelPrizeModel(awardYear: $awardYear, category: $category, prizeStatus: $prizeStatus, motivation: $motivation, prizeAmount: $prizeAmount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NobelPrizeModel &&
      other.awardYear == awardYear &&
      other.category == category &&
      other.prizeStatus == prizeStatus &&
      other.motivation == motivation &&
      other.prizeAmount == prizeAmount;
  }

  @override
  int get hashCode {
    return awardYear.hashCode ^
      category.hashCode ^
      prizeStatus.hashCode ^
      motivation.hashCode ^
      prizeAmount.hashCode;
  }
}
