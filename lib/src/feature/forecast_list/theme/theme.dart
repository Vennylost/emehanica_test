import 'package:emehanica_test/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

/// Класс, содержащий стили текста для списка прогнозов погоды
final class _ForecastListThemeText {
  final TextStyle titleTextStyle = AppTextStyles.buttonText1;
  final TextStyle dayTextStyle = AppTextStyles.text3;
  final TextStyle tempTextStyle = AppTextStyles.text3;
  final TextStyle headerTextStyle = AppTextStyles.header;
}

/// Класс, содержащий цветовые параметры для списка прогнозов погоды
final class _ForecastListThemeColors {
  final Color appBarColor = AppColors.white;
  final Color iconColor = AppColors.black;
  final Color separatorColor = AppColors.gray6;
  final Color iconBackgroundColor = AppColors.transparent;
}

/// Класс темы для списка прогнозов погоды, объединяющий стили текста и цвета
class ForecastListTheme {
  static final _ForecastListThemeColors color = _ForecastListThemeColors();
  static final _ForecastListThemeText text = _ForecastListThemeText();
}
