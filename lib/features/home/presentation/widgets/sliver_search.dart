import 'package:app_ventas/features/search/presentation/widgets/search.dart';
import 'package:flutter/material.dart';

class SliverSearch extends StatelessWidget {
  const SliverSearch({
    super.key,
    required this.isCollapsed,
  });

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 60,
      collapsedHeight: 100,
      toolbarHeight: 60,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Search(
              isCollapsed: isCollapsed,
            ),
          ],
        ),
      ),
    );
  }
}
