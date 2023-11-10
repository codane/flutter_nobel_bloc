import 'package:flutter_nobel/data/data_source/remote/dto/nobel_response_dto.dart';
import 'package:flutter_nobel/domain/model/nobel_response_model.dart';

NobelResponseModel toNobelResponseModel(NobelResponseDto dto) =>
    NobelResponseModel(
      laureates: dto.laureates,
    );
