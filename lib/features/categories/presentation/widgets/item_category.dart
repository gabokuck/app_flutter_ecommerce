import 'package:app_ventas/features/categories/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class ItemCategory extends StatelessWidget {
  final CategoryEntity category;
  const ItemCategory({
    super.key,
    required this.category,
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
              Expanded(
                child: SizedBox(
                  child: category.imageUrl.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            category.imageUrl,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                      : FlutterLogo(
                          curve: Curves.bounceIn,
                          size: 100,
                          style: FlutterLogoStyle.horizontal,
                        ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                category.name.toUpperCase(),
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
