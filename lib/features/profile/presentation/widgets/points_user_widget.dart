import 'package:app_ventas/features/auth/presentation/blocs/blocs.dart';
import 'package:app_ventas/features/points/presentation/blocs/blocs.dart';
import 'package:app_ventas/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PointsUserWidget extends StatelessWidget {
  const PointsUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userId = context.watch<AuthBloc>().state.user!.id;
    return BlocBuilder<PointsBloc, PointsState>(
      bloc: getIt<PointsBloc>()..add(LoadTotalPoints(userId)),
      builder: (context, state) {
        if (state.status == PointsStatus.error) {
          return Center(
            child: Text(state.errorMessage ?? 'Error'),
          );
        }
        return InkWell(
          onTap: () => context.push('/points'),
          child: Card(
            child: SizedBox(
              height: 100,
              child: state.status == PointsStatus.loading
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Puntos:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text(
                                '${state.totalPoints}',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          Icon(
                            Icons.remove_red_eye,
                            size: 30,
                          )
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
