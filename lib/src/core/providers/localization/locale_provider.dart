import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

@riverpod
class CurrentLocale extends _$CurrentLocale {
  @override
  Locale build() {
    return Locale('en');
  }

  void setLocale(Locale newLocale) {
    state = newLocale;
  }
}
