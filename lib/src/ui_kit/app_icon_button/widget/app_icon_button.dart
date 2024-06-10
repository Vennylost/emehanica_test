import 'package:emehanica_test/src/ui_kit/app_icon_button/theme/theme.dart';
import 'package:flutter/material.dart';

/// Виджет кнопки с иконкой.
class AppIconButton extends StatelessWidget {
  /// Callback-функция при нажатии на кнопку.
  final VoidCallback onTap;

  /// Виджет иконки.
  final Widget child;

  /// Создает экземпляр [AppIconButton].
  const AppIconButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          color: AppIconButtonTheme.color.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
