import 'package:app_ventas/features/points/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'points_event.dart';
part 'points_state.dart';

class PointsBloc extends Bloc<PointsEvent, PointsState> {
  final GetListPoints getListPoints;

  PointsBloc({required this.getListPoints}) : super(PointsState()) {
    on<LoadPointsEvent>(_loadListPointsEvent);
  }

  Future<void> _loadListPointsEvent(
      LoadPointsEvent event, Emitter<PointsState> emit) async {
    emit(state.copyWith(status: PointsStatus.loading));
    try {
      final points = await getListPoints(event.userId);
      emit(state.copyWith(status: PointsStatus.success, points: points));
    } catch (e) {
      emit(state.copyWith(
        status: PointsStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
