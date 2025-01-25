import 'package:app_ventas/features/products/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final FocusScopeNode focusNode = FocusScopeNode();
final TextEditingController controller = TextEditingController();

class InputSearch extends StatelessWidget {
  const InputSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return Expanded(
            child: FocusScope(
          node: focusNode,
          child: SearchBar(
            controller: controller,
            hintText: 'Buscar productos',
            trailing: [
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {
                  context
                      .read<ProductsBloc>()
                      .add(SearchByQueryEvent(controller.text));
                },
              ),
            ],
            onChanged: (value) {
              if (value.isEmpty) {
                context.read<ProductsBloc>().add(LoadProductsEvent());
              }
              // context.read<ProductsBloc>().add(SearchByQueryEvent(value));
            },

            // suggestionsBuilder: (context, controller) async {
            //   return state.products
            //           ?.where((p) => p.title
            //               .toLowerCase()
            //               .contains(controller.text.toLowerCase()))
            //           .map((item) {
            //         return ListTile(
            //           title: Text(item.title),
            //           onTap: () {
            //             controller.closeView(null);
            //             controller.text = item.title;
            //             FocusScope.of(context).unfocus();

            //             context
            //                 .read<ProductsBloc>()
            //                 .add(SearchByQueryEvent(controller.text));
            //           },
            //         );
            //       }).toList() ??
            //       [];
            // }
          ),
        ));
      },
    );
  }
}
