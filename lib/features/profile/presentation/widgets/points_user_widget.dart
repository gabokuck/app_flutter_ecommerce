import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PointsUserWidget extends StatelessWidget {
  const PointsUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/points'),
      child: Card(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
      ),
    );
  }
}
