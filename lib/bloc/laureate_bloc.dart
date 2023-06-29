import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nobel/data/models/laureate_model.dart';
import 'package:flutter_nobel/data/repositories/nobel_repository.dart';

part 'laureate_event.dart';
part 'laureate_state.dart';


final class LaureateBloc extends Bloc<LaureateEvent, LaureateState> {
  LaureateBloc({required this.repository, required this.categoryAbbreviation})
      : super(const LaureateState()) {
    on<LaureateFetched>(_onLaureateFetched);
  }

  final NobelRepository repository;
  final String categoryAbbreviation;

  Future<void> _onLaureateFetched(
      LaureateFetched event, Emitter<LaureateState> emit) async {
    try {
      if (state.status == LaureateStatus.initial) {
        final laureates = await repository.getApiData(apiOffset: 0,
            categoryAbbreviation: categoryAbbreviation);
        return emit(
          state.copyWith(
            status: LaureateStatus.success,
            laureatesList: laureates,
          ),
        );
      }

      final laureates = await repository.getApiData(
          apiOffset: state.laureatesList.length,
          categoryAbbreviation: categoryAbbreviation);
      return emit(state.copyWith(
          status: LaureateStatus.success,
          laureatesList: List.of(state.laureatesList)
            ..addAll(laureates)));
    } catch (e) {
      emit(state.copyWith(status: LaureateStatus.failure));
    }
  }
}
