import 'package:emehanica_test/src/feature/forecast_list/theme/theme.dart';
import 'package:emehanica_test/src/feature/home/bloc/location/location_bloc.dart';
import 'package:emehanica_test/src/core/translations/locale_keys.g.dart';
import 'package:emehanica_test/src/feature/detailed_forecast/theme/theme.dart';
import 'package:emehanica_test/src/routes/route_value.dart';
import 'package:emehanica_test/src/ui_kit/app_icon_button/widget/app_icon_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

/// Верхняя панель приложения для экрана детального прогноза.
///
/// Отображает кнопки перехода на домашний экран и список прогнозов на 3 дня,
/// а также название текущего города.
class DetailedForecastAppBar extends StatelessWidget {
  const DetailedForecastAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Кнопка перехода на домашний экран.
        AppIconButton(
          onTap: () => context.go(RouteValue.home.path),
          child: Icon(
            Icons.home_outlined,
            color: DetailedForecastTheme.color.iconColor,
          ),
        ),
        const Gap(8),
        //Отображение текущей локации
        Expanded(
          child: BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              return Text(
                state is LocationLoaded ? state.location ?? '' : '',
                style: ForecastListTheme.text.titleTextStyle,
              );
            },
          ),
        ),
        const Gap(8),
        // Кнопка перехода на список прогнозов на 3 дня.
        AppIconButton(
          onTap: () => context.push(
            RouteValue.forecastList.path,
          ),
          child: Text(
            LocaleKeys.forecastFor3Days.tr(),
            style: DetailedForecastTheme.text.actionTextStyle,
          ),
        ),
      ],
    );
  }
}
