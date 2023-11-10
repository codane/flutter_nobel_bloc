import 'package:equatable/equatable.dart';
import 'package:flutter_nobel/domain/model/laureate_model.dart';

class NobelResponseModel extends Equatable {
  final List<LaureateModel>? laureates;

  const NobelResponseModel({this.laureates});

  @override
  List<Object?> get props => [laureates];
}
