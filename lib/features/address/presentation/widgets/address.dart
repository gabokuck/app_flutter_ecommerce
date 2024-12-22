import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Text(
            '26 de Enero de 1857',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.expand_more),
        ],
      ),
    );
  }
}
