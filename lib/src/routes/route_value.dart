/// Перечисление для определения маршрутов в приложении.
enum RouteValue {
  /// Главный экран.
  home(
    path: '/',
    screenName: 'HomeScreen',
  ),

  /// Экран подробного прогноза.
  detailedForecast(
    path: '/detailedForecast',
    screenName: 'DetailedForecastScreen',
  ),

  /// Экран списка прогнозов.
  forecastList(
    path: '/forecastList',
    screenName: 'ForecastListScreen',
  ),

  /// Неизвестный экран.
  unknown(
    path: '',
    screenName: 'Unknown',
  );

  final String path;
  final String screenName;

  const RouteValue({
    required this.path,
    required this.screenName,
  });
}
