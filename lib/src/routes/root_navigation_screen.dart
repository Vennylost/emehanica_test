import 'package:flutter/material.dart';
import 'package:emehanica_test/src/core/theme/theme.dart';
import 'package:emehanica_test/src/feature/forecast_list/presentation/widgets/forecast_list_app_bar.dart';
import 'package:emehanica_test/src/routes/route_value.dart';
import 'package:emehanica_test/src/ui_kit/base_app_bar/widget/base_app_bar.dart';
import 'package:emehanica_test/src/feature/detailed_forecast/presentation/widgets/detailed_forecast_app_bar.dart';

/// Экран навигации.
///
/// Этот виджет используется как обертка для отображения подходящего AppBar
/// в зависимости от текущего местоположения в навигации.
class RootNavigationScreen extends StatelessWidget {
  final String location;
  final Widget child;

  const RootNavigationScreen({
    super.key,
    required this.child,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: child,
      ),
      appBar: _appBarByPath(location),
    );
  }

  /// Возвращает AppBar в зависимости от текущего местоположения в навигации.
  PreferredSizeWidget? _appBarByPath(String location) {
    if (location == RouteValue.detailedForecast.path) {
      return const BaseAppBar(title: DetailedForecastAppBar());
    }
    if (location == RouteValue.forecastList.path) {
      return const BaseAppBar(title: ForecastListAppBar());
    }
    return null;
  }
}
