import 'dart:convert';

class WikipediaModel {
  final String? english;
  
  WikipediaModel({
    this.english,
  });

  WikipediaModel copyWith({
    String? english,
  }) {
    return WikipediaModel(
      english: english ?? this.english,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'english': english,
    };
  }

  factory WikipediaModel.fromMap(Map<String, dynamic> map) {
    return WikipediaModel(
      english: map['english'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WikipediaModel.fromJson(String source) => WikipediaModel.fromMap(json.decode(source));

  @override
  String toString() => 'WikipediaModel(english: $english)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is WikipediaModel &&
      other.english == english;
  }

  @override
  int get hashCode => english.hashCode;
}
