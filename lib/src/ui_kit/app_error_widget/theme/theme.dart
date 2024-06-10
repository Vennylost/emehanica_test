import 'package:emehanica_test/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

final class _ErrorThemeText {
  final TextStyle messageTextStyle = AppTextStyles.text3;
  final TextStyle buttonTextStyle = AppTextStyles.buttonText1.copyWith(
    color: AppColors.blue,
  );
}

class ErrorTheme {
  static final _ErrorThemeText text = _ErrorThemeText();
}
