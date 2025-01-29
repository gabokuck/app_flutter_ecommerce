import 'package:app_ventas/core/helpers/helpers.dart';
import 'package:app_ventas/features/auth/presentation/blocs/blocs.dart';
import 'package:app_ventas/features/orders/domain/entities/entities.dart';
import 'package:app_ventas/features/orders/presentation/blocs/blocs.dart';
import 'package:app_ventas/features/profile/presentation/widgets/widgets.dart';
import 'package:app_ventas/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: appBarOrders,
          body: state.isAuthenticated
              ? ListOrdersWidget(
                  userId: state.user!.id,
                )
              : NotAuthWidget(),
        );
      },
    );
  }
}

class ListOrdersWidget extends StatelessWidget {
  final String userId;
  const ListOrdersWidget({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      bloc: getIt<OrdersBloc>()..add(LoadOrdersEvent(userId: userId)),
      builder: (context, state) {
        if (state.status == OrderStatus.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.status == OrderStatus.error) {
          return Center(
            child: Text(state.errorMessage ?? 'Error'),
          );
        }

        if (state.orders == null || state.orders!.isEmpty) {
          return Center(
            child: Text('Por el momento no tienes pedidos'),
          );
        }

        return ListView.builder(
          itemCount: state.orders?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            final OrderEntity order = state.orders![index];
            return ItemListOrder(
              order: order,
              index: index,
            );
          },
        );
      },
    );
  }
}

class ItemListOrder extends StatelessWidget {
  final OrderEntity order;
  final int index;
  const ItemListOrder({
    super.key,
    required this.order,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Card(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(order.status.toUpperCase()),
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.list,
                        size: 40,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pedido ${index + 1}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Puntos: ${order.totalPoints}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // ignore: unnecessary_null_comparison
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: order.items
                      .map((item) => ItemProductOrders(
                            item: item,
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FormatDate.format(order.createdAt),
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                          color: Colors.grey),
                    ),
                    Text(
                      'MX\$${order.total}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemProductOrders extends StatelessWidget {
  final ItemOrderEntity item;
  const ItemProductOrders({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Text('${item.product.title} x ${item.quantity}');
  }
}

PreferredSizeWidget appBarOrders = AppBar(
  centerTitle: true,
  title: Text('Mis Pedidos'),
);
