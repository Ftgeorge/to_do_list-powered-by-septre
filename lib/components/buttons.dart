import 'package:flutter/material.dart';

class button_btn extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  button_btn({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
