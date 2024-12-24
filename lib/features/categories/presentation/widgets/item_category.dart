import 'package:flutter/material.dart';

class ItemCategory extends StatelessWidget {
  final String name;
  const ItemCategory({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              FlutterLogo(
                size: 50,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                name.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
