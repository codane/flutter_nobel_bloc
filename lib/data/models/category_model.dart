import 'dart:convert';

class CategoryModel {
  final String? en;

  CategoryModel({
    this.en,
  });


  CategoryModel copyWith({
    String? en,
  }) {
    return CategoryModel(
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'en': en,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      en: map['en'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoryModel(en: $en)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoryModel &&
      other.en == en;
  }

  @override
  int get hashCode => en.hashCode;
}
