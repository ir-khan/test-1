import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = ColorScheme.of(context);
    return AppBar(
      backgroundColor: colorScheme.surfaceContainerHighest,
      surfaceTintColor: colorScheme.surfaceTint,
      title: Text(
        title,
        style: textTheme.displayMedium?.copyWith(color: colorScheme.onSurface),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
