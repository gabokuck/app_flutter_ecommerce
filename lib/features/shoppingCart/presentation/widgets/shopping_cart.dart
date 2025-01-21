import 'package:app_ventas/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              if(state.isUnauthenticated){
                ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Para poder ver el carrito de compras debes iniciar sesión'), duration: Duration(seconds: 2),));
              }
            },
            icon: Icon(Icons.shopping_cart));
      },
    );
  }
}
