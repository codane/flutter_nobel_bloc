import 'package:flutter_nobel/data/data_source/remote/dto/nobel_prize_dto.dart';
import 'package:flutter_nobel/domain/model/nobel_prize_model.dart';

NobelPrizeModel toNobelPrizeModel(NobelPrizeDto dto) => NobelPrizeModel(
      awardYear: dto.awardYear,
      category: dto.category,
      prizeStatus: dto.prizeStatus,
      motivation: dto.motivation,
      prizeAmount: dto.prizeAmount,
    );
