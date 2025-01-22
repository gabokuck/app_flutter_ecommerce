import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
