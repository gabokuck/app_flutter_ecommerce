import 'package:app_ventas/features/categories/presentation/blocs/categories/categories_bloc.dart';
import 'package:app_ventas/features/categories/presentation/widgets/item_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoriesError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is CategoriesLoaded) {
          return Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 0),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: state.categories
                    .map((category) => ItemCategory(
                          name: category.name,
                        ))
                    .toList(),
              ),
            ),
          );
        }
        return Center(child: Text('Press to load'));
      },
    );
  }
}
