import 'package:app_ventas/features/auth/presentation/blocs/blocs.dart';
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
          body: state.isAuthenticated ? ListOrdersWidget() : NotAuthWidget(),
        );
      },
    );
  }
}

class ListOrdersWidget extends StatelessWidget {
  const ListOrdersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      bloc: getIt<OrdersBloc>()..add(LoadOrdersEvent()),
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

        return ListView.builder(
          itemCount: state.orders?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return ItemListOrder();
          },
        );
      },
    );
  }
}

class ItemListOrder extends StatelessWidget {
  const ItemListOrder({
    super.key,
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
                Text('Pedido completado'),
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlutterLogo(
                        curve: Curves.bounceIn,
                        size: 100,
                        style: FlutterLogoStyle.horizontal,
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
                              'Pedido 1',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Puntos: 2'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ItemProductOrders(),
                ItemProductOrders(),
                ItemProductOrders(),
                ItemProductOrders(),
                ItemProductOrders(),
                ItemProductOrders(),
                ItemProductOrders(),
                ItemProductOrders(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '28/10/2024 5:46 PM',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 10,
                          color: Colors.grey),
                    ),
                    Text(
                      'MX\$240.00',
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
  const ItemProductOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Articulo 1');
  }
}

PreferredSizeWidget appBarOrders = AppBar(
  centerTitle: true,
  title: Text('Mis Pedidos'),
);
