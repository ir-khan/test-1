import 'package:flutter/material.dart';

import 'colors.dart';
import 'text.dart';

final border = OutlineInputBorder(
  borderSide: const BorderSide(color: AppColors.color1),
  borderRadius: BorderRadius.circular(10),
);

final appInputDecoration = InputDecorationThemeData(
  hintStyle: appText.labelSmall,
  border: border,
  focusedBorder: border,
  enabledBorder: border,
  contentPadding: const EdgeInsets.all(16),
);
