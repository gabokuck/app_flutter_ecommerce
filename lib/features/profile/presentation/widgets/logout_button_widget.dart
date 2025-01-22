import 'package:app_ventas/features/auth/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogOutButtonWidget extends StatelessWidget {
  const LogOutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AuthBloc>().logOut();
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Cerrar sesión'),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.logout),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
