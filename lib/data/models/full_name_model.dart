import 'dart:convert';

class FullNameModel {
  final String? en;
  
  FullNameModel({
    this.en,
  });
  

  FullNameModel copyWith({
    String? en,
  }) {
    return FullNameModel(
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'en': en,
    };
  }

  factory FullNameModel.fromMap(Map<String, dynamic> map) {
    return FullNameModel(
      en: map['en'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FullNameModel.fromJson(String source) => FullNameModel.fromMap(json.decode(source));

  @override
  String toString() => 'FullNameModel(en: $en)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FullNameModel &&
      other.en == en;
  }

  @override
  int get hashCode => en.hashCode;
}
