import 'package:emehanica_test/src/feature/detailed_forecast/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Элемент списка параметров.
///
/// Отображает иконку и данные параметра.
class ParameterItem extends StatelessWidget {
  final IconData icon;
  final String data;

  const ParameterItem({
    super.key,
    required this.icon,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Отображаем иконку параметра.
        Icon(
          icon,
          size: 70,
        ),
        const Gap(8),
        // Отображаем данные параметра с использованием стиля из темы детального прогноза.
        Text(
          data,
          style: DetailedForecastTheme.text.paramTextStyle,
        ),
      ],
    );
  }
}
