import 'package:app_ventas/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:app_ventas/features/points/domain/domain.dart';
import 'package:app_ventas/features/points/presentation/blocs/blocs.dart';
import 'package:app_ventas/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PointsPage extends StatelessWidget {
  const PointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.watch<AuthBloc>().state.user!.id;
    return BlocBuilder<PointsBloc, PointsState>(
      bloc: getIt<PointsBloc>()..add(LoadPointsEvent(userId)),
      builder: (context, state) {
        if (state.status == PointsStatus.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.status == PointsStatus.error) {
          return Center(
            child: Text(state.errorMessage ?? 'Error'),
          );
        }

        if (state.points == null || state.points!.isEmpty) {
          return Center(
            child: Text('No hay pedidos'),
          );
        }

        return ListView.builder(
          itemCount: state.points?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            final PointEntity point = state.points![index];
            return Text(point.points.toString());
          },
        );
      },
    );
  }
}
