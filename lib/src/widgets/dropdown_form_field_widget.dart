import 'package:flutter/material.dart';

class DropdownFormFieldWidget<T> extends StatelessWidget {
  const DropdownFormFieldWidget({
    super.key,
    this.initialValue,
    required this.items,
    required this.onChange,
    this.validator,
  });

  final T? initialValue;
  final List<T> items;
  final void Function(T?) onChange;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DropdownButtonFormField<T>(
      initialValue: initialValue,
      items: items
          .map((g) {
            return DropdownMenuItem(
              value: g,
              child: Text(g.toString(), style: textTheme.bodySmall),
            );
          })
          .toList(growable: false),
      onChanged: onChange,
      validator: validator,
    );
  }
}
