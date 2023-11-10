import 'package:flutter_nobel/domain/model/motivation_model.dart';

class MotivationDto extends MotivationModel {
  const MotivationDto({
    String? en,
  }) : super(en: en);

  factory MotivationDto.fromMap(Map<String, dynamic> map) => MotivationDto(
        en: map['en'],
      );
}
