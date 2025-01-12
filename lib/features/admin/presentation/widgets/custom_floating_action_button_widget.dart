import 'package:flutter/material.dart';

class CustomFloatingActionButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  const CustomFloatingActionButtonWidget({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
        onPressed: onPressed, child: Icon(Icons.add));
  }
}
