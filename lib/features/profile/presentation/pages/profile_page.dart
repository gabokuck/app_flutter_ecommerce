import 'package:app_ventas/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(actions: listActionsProfile),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                if (state is AuthAuthenticated) UserWidget(),
                if (state is AuthAuthenticated) PointsUserWidget(),
                if (state is AuthAuthenticated) LogOutButtonWidget(),
                if (state is! AuthAuthenticated) NotAuthWidget(),
              ],
            ));
      },
    );
  }
}

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

class NotAuthWidget extends StatelessWidget {
  const NotAuthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.8,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_sharp,
              color: Colors.grey,
              size: 100,
            ),
            Text(
              'Por favor inicia sesión o crea una cuenta',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  context.push('/login');
                },
                child: Text('Iniciar sesión')),
            TextButton(onPressed: () {}, child: Text('Crear cuenta'))
          ],
        ),
      ),
    );
  }
}

class PointsUserWidget extends StatelessWidget {
  const PointsUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Padding(
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    '15',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye,
                    size: 30,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> listActionsProfile = [
  IconButton(onPressed: () {}, icon: Icon(Icons.notifications_active)),
  IconButton(onPressed: () {}, icon: Icon(Icons.phone))
];

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return SizedBox(
            width: double.infinity,
            height: 120,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 40,
                    child: Icon(Icons.person_sharp),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.user?.names} ${state.user?.surnames}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            '${state.user?.email}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('¡Hola!'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
