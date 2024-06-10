import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emehanica_test/src/core/translations/locale_keys.g.dart';
import 'package:emehanica_test/src/core/models/weather_model.dart';
import 'package:emehanica_test/src/core/utils/icon_provider.dart';
import 'package:emehanica_test/src/feature/forecast_list/theme/theme.dart';

/// Элемент списка прогнозов.
class ForecastItem extends StatelessWidget {
  final WeatherModel weather;

  const ForecastItem({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // День недели прогноза.
        Text(
          DateFormat.E('ru')
              .format(
                weather.dateTime,
              )
              .toLowerCase(),
          style: ForecastListTheme.text.dayTextStyle,
        ),
        // Иконка погоды прогноза.
        SvgPicture.asset(
          IconProvider.buildSvgByNameUrl(
            weather.weather.first.icon,
          ),
          width: 45,
        ),
        // Температура прогноза.
        Text(
          LocaleKeys.cel.tr(args: [weather.main.temp.toStringAsFixed(2)]),
          style: ForecastListTheme.text.tempTextStyle,
        ),
      ],
    );
  }
}
