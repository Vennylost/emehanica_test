import 'package:emehanica_test/src/feature/forecast_list/theme/theme.dart';
import 'package:emehanica_test/src/feature/home/bloc/location/location_bloc.dart';
import 'package:emehanica_test/src/ui_kit/app_icon_button/widget/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

/// Верхняя панель приложения для экрана списка прогнозов.
class ForecastListAppBar extends StatelessWidget {
  const ForecastListAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Кнопка "Назад".
        AppIconButton(
          onTap: () => context.pop(),
          child: Icon(
            Icons.arrow_back,
            color: ForecastListTheme.color.iconColor,
          ),
        ),
        const Gap(16),
        Expanded(
          // Виджет для отображения текущего местоположения.
          child: BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              return Text(
                // Отображаем название местоположения, если оно загружено.
                state is LocationLoaded ? state.location ?? '' : '',
                style: ForecastListTheme.text.titleTextStyle,
              );
            },
          ),
        ),
      ],
    );
  }
}
