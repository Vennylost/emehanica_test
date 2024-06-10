import 'package:emehanica_test/src/core/theme/theme.dart';
import 'package:flutter/material.dart';

final class _TextFieldThemeText {
  final TextStyle textFieldTextStyle = AppTextStyles.buttonText1.copyWith(
    color: AppColors.black,
  );
  final TextStyle textFieldHintStyle = AppTextStyles.buttonText1.copyWith(
    color: AppColors.gray6,
  );
  final TextStyle validationErrorTextStyle = AppTextStyles.text2.copyWith(
    color: AppColors.red,
  );
}

final class _TextFieldThemeColors {
  final Color containerColor = AppColors.white;
  final Color focusBorderColor = AppColors.black;
  final Color unfocusBorderColor = AppColors.gray6;
  final Color prefixIconTextFieldColor = AppColors.white;
}

class TextFieldTheme {
  static final _TextFieldThemeColors color = _TextFieldThemeColors();
  static final _TextFieldThemeText text = _TextFieldThemeText();
}
