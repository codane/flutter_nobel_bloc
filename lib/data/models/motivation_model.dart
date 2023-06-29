import 'dart:convert';

class MotivationModel {
  final String? en;
  
  MotivationModel({
    this.en,
  });

  MotivationModel copyWith({
    String? en,
  }) {
    return MotivationModel(
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'en': en,
    };
  }

  factory MotivationModel.fromMap(Map<String, dynamic> map) {
    return MotivationModel(
      en: map['en'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MotivationModel.fromJson(String source) => MotivationModel.fromMap(json.decode(source));

  @override
  String toString() => 'MotivationModel(en: $en)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MotivationModel &&
      other.en == en;
  }

  @override
  int get hashCode => en.hashCode;
}
