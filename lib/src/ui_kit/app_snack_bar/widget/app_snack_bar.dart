import 'package:emehanica_test/src/ui_kit/app_snack_bar/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Виджет для отображения всплывающего сообщения.
class AppSnackBar extends StatelessWidget {
  /// Текст сообщения.
  final String text;

  /// Создает экземпляр [AppSnackBar].
  const AppSnackBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: SnackBarTheme.color.backgroundColor,
        child: Align(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              color: SnackBarTheme.color.containerColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              text,
              style: SnackBarTheme.text.messageTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  /// Показывает всплывающее сообщение с заданным текстом.
  ///
  /// Параметры:
  /// * [context] - контекст приложения.
  /// * [text] - текст сообщения.
  static void show(BuildContext context, String text) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AppSnackBar(text: text);
      },
    );

    // Закрывает сообщение после задержки.
    Future.delayed(const Duration(milliseconds: 1300), () {
      context.pop();
    });
  }
}
