import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.grey,
  fontFamily: 'SF', // w400
  // textSelectionTheme: TextSelectionThemeData(
  //   cursorColor: AppColors.white50,
  //   selectionColor: AppColors.white50,
  //   selectionHandleColor: AppColors.white50,
  // ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.navBar, // overscroll indicator color
  ),
);
