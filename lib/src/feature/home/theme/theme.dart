import 'package:emehanica_test/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

/// Класс, содержащий стили текста для главного экрана
final class _HomeThemeText {
  final TextStyle headerTextStyle = AppTextStyles.header;
}

/// Класс темы для главного экрана
class HomeTheme {
  static final _HomeThemeText text = _HomeThemeText();
}
