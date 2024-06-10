import 'package:emehanica_test/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

final class _AppButtonThemeText {
  final TextStyle buttonTextStyle = AppTextStyles.buttonText1.copyWith(
    color: AppColors.white,
  );
}

final class _AppButtonThemeColors {
  final Color buttonColor = AppColors.blue;
}

class AppButtonTheme {
  static final _AppButtonThemeColors color = _AppButtonThemeColors();
  static final _AppButtonThemeText text = _AppButtonThemeText();
}
