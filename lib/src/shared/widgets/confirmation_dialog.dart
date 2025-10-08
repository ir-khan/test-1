import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.description,
    required this.okText,
    required this.cancelText,
  });

  final String title;
  final String description;
  final String okText;
  final String cancelText;

  Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(context: context, builder: (_) => this) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      title: Text(title, style: textTheme.titleMedium),
      content: Text(description, style: textTheme.labelMedium),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(okText),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelText),
        ),
      ],
    );
  }
}
