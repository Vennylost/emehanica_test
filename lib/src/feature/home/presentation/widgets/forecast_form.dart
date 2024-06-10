import 'package:emehanica_test/src/feature/home/bloc/location/location_bloc.dart';
import 'package:emehanica_test/src/routes/route_value.dart';
import 'package:emehanica_test/src/core/translations/locale_keys.g.dart';
import 'package:emehanica_test/src/feature/home/theme/theme.dart';
import 'package:emehanica_test/src/ui_kit/app_button/widget/app_button.dart';
import 'package:emehanica_test/src/ui_kit/app_text_field/widget/app_text_field.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';

/// Форма для поиска прогноза погоды по городу.
class ForecastForm extends StatelessWidget {
  final TextEditingController controller;

  ForecastForm({
    super.key,
    required this.controller,
  });

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          LocaleKeys.search.tr(),
          style: HomeTheme.text.headerTextStyle,
        ),
        Form(
          key: _form,
          child: Column(
            children: [
              // Поле ввода города
              AppTextField(
                validator:
                    ValidationBuilder(requiredMessage: LocaleKeys.required.tr())
                        .required()
                        .build(),
                controller: controller,
                hintText: LocaleKeys.enterCity.tr(),
                prefixIcon: const Icon(Icons.search),
              ),
              const Gap(8),
              // Кнопка для выполнения поиска
              AppButton(
                label: LocaleKeys.search.tr(),
                onTap: () {
                  //Проверка валидации
                  if (_form.currentState!.validate()) {
                    // Добавление события сохранения местоположения через Bloc
                    context.read<LocationBloc>().add(
                          SaveLocationEvent(
                            cityName: controller.text,
                            // Навигация на экран прогноза погоды после сохранения
                            navigate: () {
                              context.go(
                                RouteValue.detailedForecast.path,
                              );
                            },
                          ),
                        );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
