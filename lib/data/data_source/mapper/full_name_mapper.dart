import 'package:flutter_nobel/data/data_source/remote/dto/full_name_dto.dart';
import 'package:flutter_nobel/domain/model/full_name_model.dart';

FullNameModel toFullNameModel(FullNameDto dto) => FullNameModel(
  en: dto.en,
);