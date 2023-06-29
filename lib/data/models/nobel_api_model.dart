import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_nobel/data/models/laureate_model.dart';

class NobelApiModel {
  final List<LaureateModel>? laureates;
  
  NobelApiModel({
    this.laureates,
  });
  

  NobelApiModel copyWith({
    List<LaureateModel>? laureates,
  }) {
    return NobelApiModel(
      laureates: laureates ?? this.laureates,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'laureates': laureates?.map((x) => x.toMap()).toList(),
    };
  }

  factory NobelApiModel.fromMap(Map<String, dynamic> map) {
    return NobelApiModel(
      laureates: map['laureates'] != null ? List<LaureateModel>.from(map['laureates']?.map((x) => LaureateModel.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NobelApiModel.fromJson(String source) => NobelApiModel.fromMap(json.decode(source));

  @override
  String toString() => 'NobelApiModel(laureates: $laureates)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NobelApiModel &&
      listEquals(other.laureates, laureates);
  }

  @override
  int get hashCode => laureates.hashCode;
}
