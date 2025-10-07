import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      style: textTheme.labelMedium,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
