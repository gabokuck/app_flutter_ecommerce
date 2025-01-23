import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SearchAnchor.bar(
            barHintText: 'Buscar productos',
            onChanged: (value) {
              print(value);
            },
            suggestionsBuilder: (context, controller) {
              return <Widget>[
                Text('Sugerencia 1'),
              ];
            }));
  }
}
