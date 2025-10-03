import 'package:flutter/material.dart';

class DropdownFormFieldWidget<T> extends StatelessWidget {
  DropdownFormFieldWidget({
    super.key,
    this.initialValue,
    required this.items,
    required this.itemLabel,
    required this.onChange,
    this.validator,
  });

  final T? initialValue;
  final List<T> items;
  final String Function(T) itemLabel;
  final void Function(T?) onChange;
  final String? Function(T?)? validator;

  final border = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.limeAccent),
    borderRadius: BorderRadius.circular(8),
  );

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: initialValue,
      items: items
          .map((g) {
            return DropdownMenuItem(value: g, child: Text(itemLabel(g)));
          })
          .toList(growable: false),
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(
        border: border,
        focusedBorder: border,
        enabledBorder: border,
      ),
    );
  }
}
