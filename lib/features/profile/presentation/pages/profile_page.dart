import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: listActionsProfile),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [UserWidget(), PointsUserWidget()],
        ));
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
                      'Gabriel Rosa',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
}
