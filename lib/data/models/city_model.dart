import 'dart:convert';

class CityModel {
  final String? en;
  
  CityModel({
    this.en,
  });

  CityModel copyWith({
    String? en,
  }) {
    return CityModel(
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'en': en,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      en: map['en'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) => CityModel.fromMap(json.decode(source));

  @override
  String toString() => 'CityModel(en: $en)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CityModel &&
      other.en == en;
  }

  @override
  int get hashCode => en.hashCode;
}
