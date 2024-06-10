import 'package:emehanica_test/src/ui_kit/app_button/theme/theme.dart';
import 'package:flutter/material.dart';

/// Кнопка в приложении.
class AppButton extends StatelessWidget {
  /// Текст кнопки.
  final String label;

  /// Callback-функция при нажатии на кнопку.
  final VoidCallback onTap;

  /// Создает экземпляр [AppButton].
  const AppButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 11,
        ),
        decoration: BoxDecoration(
          color: AppButtonTheme.color.buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: AppButtonTheme.text.buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
