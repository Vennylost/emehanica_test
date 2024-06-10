import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gap/gap.dart';
import 'package:emehanica_test/src/core/translations/locale_keys.g.dart';
import 'package:emehanica_test/src/feature/home/theme/theme.dart';
import 'package:emehanica_test/src/ui_kit/app_button/widget/app_button.dart';
import 'package:emehanica_test/src/ui_kit/app_text_field/widget/app_text_field.dart';
import 'package:emehanica_test/src/feature/home/bloc/authentication/authentication_bloc.dart';

/// Форма входа в систему.
class LogInForm extends StatelessWidget {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _minPasswordLength = 4;
  final _minUserNameLength = 2;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  LogInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Заголовок формы входа
        Text(
          LocaleKeys.logIn.tr(),
          style: HomeTheme.text.headerTextStyle,
        ),
        Form(
          key: _form,
          child: Column(
            children: [
              // Поле ввода электронной почты
              AppTextField(
                validator:
                    ValidationBuilder(requiredMessage: LocaleKeys.required.tr())
                        .email(LocaleKeys.uncorrectedEmail.tr())
                        .build(),
                controller: _emailController,
                hintText: LocaleKeys.email.tr(),
                prefixIcon: const Icon(Icons.mail),
              ),
              const Gap(12),
              // Поле ввода имени пользователя
              AppTextField(
                //определение валидации с минимальным кол-вом символов
                validator:
                    ValidationBuilder(requiredMessage: LocaleKeys.required.tr())
                        .minLength(
                          _minUserNameLength,
                          plural(LocaleKeys.minLength, _minUserNameLength),
                        )
                        .build(),
                controller: _usernameController,
                hintText: LocaleKeys.username.tr(),
                prefixIcon: const Icon(Icons.person),
              ),
              const Gap(12),
              // Поле ввода пароля
              AppTextField(
                //определение валидации с минимальным кол-вом символов
                validator:
                    ValidationBuilder(requiredMessage: LocaleKeys.required.tr())
                        .minLength(
                          _minPasswordLength,
                          plural(LocaleKeys.minLength, _minPasswordLength),
                        )
                        .build(),
                controller: _passwordController,
                hintText: LocaleKeys.password.tr(),
                obscureText: true,
                prefixIcon: const Icon(Icons.lock),
              ),
              const Gap(12),
            ],
          ),
        ),
        // Кнопка для выполнения входа
        AppButton(
          label: LocaleKeys.logIn.tr(),
          onTap: () {
            //проверка валидации
            if (_form.currentState!.validate()) {
              //если валидация успешная, отправка события в блок
              context.read<AuthenticationBloc>().add(
                    CreateUserEvent(
                      email: _emailController.text,
                      username: _usernameController.text,
                      password: _passwordController.text,
                    ),
                  );
            }
          },
        ),
      ],
    );
  }
}
