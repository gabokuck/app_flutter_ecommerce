import 'package:app_ventas/features/auth/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.isAuthenticated) {
          return SizedBox(
            child: Text(
              'Hola, ${state.user?.names}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }

        return SizedBox(
          child: Text(
            'Hola, invitado',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
