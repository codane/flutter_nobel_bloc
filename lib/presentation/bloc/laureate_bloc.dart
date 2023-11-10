import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nobel/domain/model/laureate_model.dart';
import 'package:flutter_nobel/domain/use_case/get_laureates_use_case.dart';

part 'laureate_event.dart';
part 'laureate_state.dart';


final class LaureateBloc extends Bloc<LaureateEvent, LaureateState> {
  LaureateBloc({required this.getLaureatesUseCase, required this.categoryAbbreviation})
      : super(const LaureateState()) {
    on<LaureateFetched>(_onLaureateFetched);
  }

  final GetLaureatesUseCase getLaureatesUseCase;
  final String categoryAbbreviation;

  Future<void> _onLaureateFetched(
      LaureateFetched event, Emitter<LaureateState> emit) async {
    try {
      if (state.status == LaureateStatus.initial) {
        final laureates = await getLaureatesUseCase(apiOffset: 0,
            categoryAbbreviation: categoryAbbreviation);
        return emit(
          state.copyWith(
            status: LaureateStatus.success,
            laureatesList: laureates,
          ),
        );
      }

      final laureates = await getLaureatesUseCase(
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
