import 'package:app_ventas/core/helpers/helpers.dart';
import 'package:app_ventas/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:app_ventas/features/points/domain/domain.dart';
import 'package:app_ventas/features/points/presentation/blocs/blocs.dart';
import 'package:app_ventas/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final TextStyle fontBold = TextStyle(fontWeight: FontWeight.bold);

class PointsPage extends StatelessWidget {
  const PointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.watch<AuthBloc>().state.user!.id;
    return Scaffold(
      appBar: AppBar(
        title: Text('Puntos'),
      ),
      body: BlocBuilder<PointsBloc, PointsState>(
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
              return Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                child: Card(
                    child: SizedBox(
                        child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Puntos:',
                        style: fontBold,
                      ),
                      Text('${point.points}'),
                      SizedBox(height: 8),
                      Text(
                        'Total pedidos:',
                        style: fontBold,
                      ),
                      Text('MX ${point.order.total.toString()}'),
                      SizedBox(height: 8),
                      Text(
                        'Fecha de pedido:',
                        style: fontBold,
                      ),
                      Text(FormatDate.format(point.order.createdAt)),
                      SizedBox(height: 8),
                      Text(
                        'Fecha de expiración:',
                        style: fontBold,
                      ),
                      Text(FormatDate.format(point.expirationDate))
                    ],
                  ),
                ))),
              );
            },
          );
        },
      ),
    );
  }
}
