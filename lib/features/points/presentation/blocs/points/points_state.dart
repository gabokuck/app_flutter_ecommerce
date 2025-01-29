part of 'points_bloc.dart';

enum PointsStatus {
  initial,
  loading,
  success,
  error,
}

class PointsState extends Equatable {
  final PointsStatus status;
  final String? errorMessage;
  final List<PointEntity>? points;

  const PointsState(
      {this.status = PointsStatus.initial, this.errorMessage, this.points});

  PointsState copyWith({
    PointsStatus? status,
    String? errorMessage,
    List<PointEntity>? points,
  }) {
    return PointsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      points: points ?? this.points,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, points];
}
