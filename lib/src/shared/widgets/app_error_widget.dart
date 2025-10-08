import 'package:flutter/material.dart';

import '../../base/l10n/app_localizations.dart';
import 'button.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key, required this.error, required this.onRetry});

  final String error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Error: $error'),
        Button(label: lang.retry, onTap: onRetry),
      ],
    );
  }
}
