import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'buttons.dart';
import 'colors.dart';
import 'input.dart';
import 'switch.dart';
import 'text.dart';

final appTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.white,
  colorScheme: appColorScheme,
  textTheme: appText,
  elevatedButtonTheme: appElevatedButton,
  floatingActionButtonTheme: appFloatingActionButton,
  inputDecorationTheme: appInputDecoration,
  switchTheme: appSwitch,
  cupertinoOverrideTheme: NoDefaultCupertinoThemeData(applyThemeToAll: true),
);
