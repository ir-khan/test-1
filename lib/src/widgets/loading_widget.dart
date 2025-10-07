import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return Center(child: CircularProgressIndicator(color: colorScheme.primary));
  }
}
