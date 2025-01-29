part of 'points_bloc.dart';

enum PointsStatus {
  initial,
  loading,
  success,
  error,
}

class PointsState extends Equatable {
  final PointsStatus status;
  final int totalPoints;
  final String? errorMessage;
  final List<PointEntity>? points;

  const PointsState(
      {this.status = PointsStatus.initial,
      this.totalPoints = 0,
      this.errorMessage,
      this.points});

  PointsState copyWith({
    PointsStatus? status,
    int? totalPoints,
    String? errorMessage,
    List<PointEntity>? points,
  }) {
    return PointsState(
      status: status ?? this.status,
      totalPoints: totalPoints ?? this.totalPoints,
      errorMessage: errorMessage ?? this.errorMessage,
      points: points ?? this.points,
    );
  }

  @override
  List<Object?> get props => [status, totalPoints, errorMessage, points];
}
