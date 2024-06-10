import 'package:emehanica_test/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

final class _SnackBarThemeText {
  final TextStyle messageTextStyle = AppTextStyles.buttonText1.copyWith(
    color: AppColors.white,
  );
}

final class _SnackBarThemeColors {
  final Color containerColor = AppColors.gray2;
  final Color backgroundColor = AppColors.transparent;
}

class SnackBarTheme {
  static final _SnackBarThemeColors color = _SnackBarThemeColors();
  static final _SnackBarThemeText text = _SnackBarThemeText();
}
