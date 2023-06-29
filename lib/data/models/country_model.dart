import 'dart:convert';

class CountryModel {
  final String? en;
  
  CountryModel({
    this.en,
  });

  CountryModel copyWith({
    String? en,
  }) {
    return CountryModel(
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'en': en,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      en: map['en'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) => CountryModel.fromMap(json.decode(source));

  @override
  String toString() => 'CountryModel(en: $en)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CountryModel &&
      other.en == en;
  }

  @override
  int get hashCode => en.hashCode;
}
