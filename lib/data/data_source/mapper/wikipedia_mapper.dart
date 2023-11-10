import 'package:flutter_nobel/data/data_source/remote/dto/wikipedia_dto.dart';
import 'package:flutter_nobel/domain/model/wikipedia_model.dart';

WikipediaModel toWikipediaModel(WikipediaDto dto) => WikipediaModel(
      english: dto.english,
    );
