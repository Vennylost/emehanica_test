import 'package:emehanica_test/src/ui_kit/app_text_field/theme/theme.dart';
import 'package:emehanica_test/src/ui_kit/app_text_field/widget/components/error_text.dart';
import 'package:emehanica_test/src/ui_kit/app_text_field/widget/components/text_field_border.dart';
import 'package:flutter/material.dart';

/// Виджет текстового поля с возможностью скрытия вводимого текста.
class AppTextField extends StatefulWidget {
  /// Контроллер текстового поля.
  final TextEditingController controller;

  /// Подсказка для текстового поля.
  final String? hintText;

  /// Префиксная иконка для текстового поля.
  final Widget? prefixIcon;

  /// Флаг, указывающий, скрыт ли текст в текстовом поле.
  final bool obscureText;

  /// Функция для валидации
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  ///Сообщение об ошибке
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: TextFormField(
            //если валидация не была определена, возвращаем null
            validator: widget.validator != null
                ? (value) {
                    setState(() {
                      // Устанавливаем новое значение сообщения об ошибке, вызывая валидатор и передавая ему значение
                      // введенное пользователем, а затем присваиваем результат переменной errorMessage.
                      errorMessage = widget.validator!(value);
                    });
                    // Возвращаем сообщение об ошибке.
                    return errorMessage;
                  }
                : null,
            controller: widget.controller,
            style: TextFieldTheme.text.textFieldTextStyle,
            //потеря фокуса при тапе вне поля
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: TextFieldTheme.color.containerColor,
              isDense: true,
              hintText: widget.hintText,
              hintStyle: TextFieldTheme.text.textFieldHintStyle,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: widget.prefixIcon,
              ),
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 24,
                minWidth: 24,
              ),
              focusedBorder:
                  textFieldBorder(TextFieldTheme.color.focusBorderColor),
              border: textFieldBorder(TextFieldTheme.color.unfocusBorderColor),
              errorStyle: const TextStyle(fontSize: 0),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
            ),
          ),
        ),
        //Есои сообщение об ошибке не null, отображаем ошибку
        if (errorMessage != null) ErrorText(message: errorMessage ?? ''),
      ],
    );
  }
}
