part of 'laureate_bloc.dart';

sealed class LaureateEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LaureateFetched extends LaureateEvent {}