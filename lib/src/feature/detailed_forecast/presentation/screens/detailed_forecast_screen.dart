import 'package:emehanica_test/src/core/translations/locale_keys.g.dart';
import 'package:emehanica_test/src/core/utils/capitalize_first_letter.dart';
import 'package:emehanica_test/src/core/utils/icon_provider.dart';
import 'package:emehanica_test/src/feature/detailed_forecast/bloc/detailed_forecast_bloc.dart';
import 'package:emehanica_test/src/feature/detailed_forecast/presentation/widgets/parameter_item.dart';
import 'package:emehanica_test/src/feature/detailed_forecast/theme/theme.dart';
import 'package:emehanica_test/src/ui_kit/app_error_widget/widget/app_error_widget.dart';
import 'package:emehanica_test/src/ui_kit/app_snack_bar/widget/app_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

/// Экран детального прогноза.
class DetailedForecastScreen extends StatelessWidget {
  const DetailedForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailedForecastBloc()
        ..add(
          GetDetailedForecastEvent(), //Отправка события для получения детального прогноза
        ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: BlocConsumer<DetailedForecastBloc, DetailedForecastState>(
          listener: (context, state) {
            if (state is DetailedForecastError) {
              // Показываем сообщение об ошибке в виде Snackbar'а
              AppSnackBar.show(context, state.message);
            }
          },
          builder: (context, state) => state is DetailedForecastLoaded
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Отображаем иконку погоды
                    SvgPicture.asset(
                      IconProvider.buildSvgByNameUrl(
                        state.detailedForecast.weather.first.icon,
                      ),
                      width: 280,
                    ),
                    Column(
                      children: [
                        // Отображаем температуру
                        Text(
                          LocaleKeys.cel.tr(
                            args: [
                              state.detailedForecast.main.temp.toString(),
                            ],
                          ),
                          style: DetailedForecastTheme.text.tempTextStyle,
                        ),
                        const Gap(8),
                        // Отображаем описание погоды
                        Text(
                          capitalizeFirstLetter(
                            state.detailedForecast.weather.first.description,
                          ),
                          style:
                              DetailedForecastTheme.text.descriptionTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Отображаем влажность и скорость ветра
                        ParameterItem(
                          icon: Icons.water_drop_outlined,
                          data: LocaleKeys.per.tr(
                            args: [
                              state.detailedForecast.main.humidity.toString(),
                            ],
                          ),
                        ),
                        ParameterItem(
                          icon: Icons.air_outlined,
                          data: LocaleKeys.ms.tr(
                            args: [
                              state.detailedForecast.wind.speed.toString(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : state is DetailedForecastError
                  ? AppErrorWidget(
                      // Показываем виджет ошибки
                      onRetry: () => context.read<DetailedForecastBloc>()
                        ..add(
                          GetDetailedForecastEvent(),
                        ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
        ),
      ),
    );
  }
}
