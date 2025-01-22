import 'package:app_ventas/features/auth/auth.dart';
import 'package:app_ventas/features/profile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                if (state.isAuthenticated) UserInfoWidget(),
                if (state.isAuthenticated) PointsUserWidget(),
                if (state.isAuthenticated) LogOutButtonWidget(),
                if (state.isUnauthenticated) NotAuthWidget(),
              ],
            ));
      },
    );
  }
}

List<Widget> listActionsProfile = [
  IconButton(onPressed: () {}, icon: Icon(Icons.notifications_active)),
  IconButton(onPressed: () {}, icon: Icon(Icons.phone))
];
