import 'package:emehanica_test/src/ui_kit/app_text_field/theme/theme.dart';
import 'package:flutter/material.dart';

/// Виджет для отображения ошибки валидации
class ErrorText extends StatelessWidget {
  final String message;
  const ErrorText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Text(
        message,
        style: TextFieldTheme.text.validationErrorTextStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
