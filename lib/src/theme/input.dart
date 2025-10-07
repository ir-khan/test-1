import 'package:flutter/material.dart';

import '../constants/sizes.dart';
import 'colors.dart';
import 'text.dart';

final border = OutlineInputBorder(
  borderSide: const BorderSide(color: AppColors.color1),
  borderRadius: kRadius10,
);

final appInputDecoration = InputDecorationThemeData(
  hintStyle: appText.labelSmall,
  border: border,
  errorBorder: border.copyWith(
    borderSide: BorderSide(color: appColorScheme.error),
  ),
  focusedBorder: border,
  enabledBorder: border,
  contentPadding: kPadding16,
  errorStyle: appText.labelSmall?.copyWith(color: appColorScheme.error),
  visualDensity: VisualDensity.compact,
);
