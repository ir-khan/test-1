import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: Text(label));
  }
}
