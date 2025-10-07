import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'base/l10n/app_localizations.dart';
import 'core/providers/localization/locale_provider.dart';
import 'router/router.dart';
import 'theme/theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Test 1',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: ref.watch(currentLocaleProvider),
      theme: ref.watch(appThemeProvider),
      routerConfig: ref.watch(routerConfigProvider),
    );
  }
}
