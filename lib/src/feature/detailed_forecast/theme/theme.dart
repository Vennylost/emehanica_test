import 'package:emehanica_test/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

/// Класс, содержащий стили текста для детального прогноза погоды
final class _DetailedForecastThemeText {
  final TextStyle titleTextStyle = AppTextStyles.buttonText1;
  final TextStyle headerTextStyle = AppTextStyles.header;
  final TextStyle tempTextStyle = AppTextStyles.title1;
  final TextStyle descriptionTextStyle = AppTextStyles.title2;
  final TextStyle paramTextStyle = AppTextStyles.text1;
  final TextStyle actionTextStyle = AppTextStyles.buttonText1.copyWith(
    color: AppColors.blue,
  );
}

/// Класс, содержащий цветовые параметры для детального прогноза погоды
final class _DetailedForecastThemeColors {
  final Color appBarColor = AppColors.white;
  final Color iconColor = AppColors.black;
  final Color iconBackgroundColor = AppColors.transparent;
}

/// Класс темы для детального прогноза погоды, объединяющий стили текста и цвета
class DetailedForecastTheme {
  static final _DetailedForecastThemeColors color =
      _DetailedForecastThemeColors();
  static final _DetailedForecastThemeText text = _DetailedForecastThemeText();
}
