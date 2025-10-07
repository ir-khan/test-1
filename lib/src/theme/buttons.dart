import 'package:flutter/material.dart';

import '../constants/sizes.dart';
import 'colors.dart';
import 'text.dart';

final appElevatedButton = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.color2,
    foregroundColor: AppColors.white,
    shape: RoundedRectangleBorder(borderRadius: kRadius10),
    textStyle: appText.bodySmall,
  ),
);

final appFloatingActionButton = FloatingActionButtonThemeData(
  backgroundColor: AppColors.color3,
  foregroundColor: AppColors.color5,
  shape: StadiumBorder(),
  iconSize: 30,
);
