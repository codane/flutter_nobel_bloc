import 'package:flutter_nobel/data/data_source/remote/dto/motivation_dto.dart';
import 'package:flutter_nobel/domain/model/motivation_model.dart';

MotivationModel toMotivationModel(MotivationDto dto) => MotivationModel(
      en: dto.en,
    );
