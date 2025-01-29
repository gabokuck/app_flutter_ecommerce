part of 'points_bloc.dart';

sealed class PointsEvent extends Equatable {
  const PointsEvent();

  @override
  List<Object> get props => [];
}

class LoadPointsEvent extends PointsEvent {
  final String userId;
  const LoadPointsEvent(this.userId);
  @override
  List<Object> get props => [userId];
}

class LoadTotalPoints extends PointsEvent {
  final String userId;
  const LoadTotalPoints(this.userId);
  @override
  List<Object> get props => [userId];
}
