part of 'laureate_bloc.dart';

enum LaureateStatus { initial, success, failure }

final class LaureateState extends Equatable {
  final LaureateStatus status;
  final List<LaureateModel> laureatesList;

  const LaureateState({
    this.status = LaureateStatus.initial,
    this.laureatesList = const <LaureateModel>[],
  });

  LaureateState copyWith({
    LaureateStatus? status,
    List<LaureateModel>? laureatesList,
  }) {
    return LaureateState(
      status: status ?? this.status,
      laureatesList: laureatesList ?? this.laureatesList,
    );
  }

  @override
  List<Object?> get props => [status, laureatesList];
}
