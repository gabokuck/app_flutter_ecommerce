import 'package:app_ventas/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.pushReplacement('/home');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email')),
                TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password')),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(
                      LoginEvent(
                        emailController.text,
                        passwordController.text,
                      ),
                    );
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
