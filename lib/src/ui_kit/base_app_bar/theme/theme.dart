import 'package:emehanica_test/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

final class _BaseAppBarThemeText {
  final TextStyle titleTextStyle = AppTextStyles.buttonText1;
  final TextStyle actionTextStyle = AppTextStyles.buttonText1.copyWith(
    color: AppColors.blue,
  );
}

final class _BaseAppBarThemeColors {
  final appBarColor = AppColors.white;
  final iconColor = AppColors.black;
}

class BaseAppBarTheme {
  static final _BaseAppBarThemeColors color = _BaseAppBarThemeColors();
  static final _BaseAppBarThemeText text = _BaseAppBarThemeText();
}
