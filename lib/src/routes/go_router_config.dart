import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:emehanica_test/src/feature/detailed_forecast/presentation/screens/detailed_forecast_screen.dart';
import 'package:emehanica_test/src/feature/forecast_list/presentation/screens/forecast_list_screen.dart';
import 'package:emehanica_test/src/routes/root_navigation_screen.dart';
import 'package:emehanica_test/src/routes/route_value.dart';
import 'package:emehanica_test/src/feature/home/presentation/screens/home_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

/// Создает экземпляр маршрутизатора GoRouter с настройками для приложения.
///
/// Возвращает экземпляр [GoRouter].
GoRouter buildGoRouter() {
  return GoRouter(
    initialLocation: RouteValue.home.path,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      // Маршрут для основного контента приложения
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            child: RootNavigationScreen(
              location: state.uri.path,
              child: child,
            ),
          );
        },
        routes: [
          // Маршрут для домашнего экрана
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: RouteValue.home.path,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: HomeScreen(
                  key: UniqueKey(),
                ),
              );
            },
          ),
        ],
      ),
      // Маршрут для подэкранов детального прогноза и списка прогнозов
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            child: RootNavigationScreen(
              location: state.uri.path,
              child: child,
            ),
          );
        },
        routes: [
          // Маршрут для детального прогноза
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: RouteValue.detailedForecast.path,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: DetailedForecastScreen(
                  key: UniqueKey(),
                ),
              );
            },
          ),
          // Маршрут для списка прогнозов
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: RouteValue.forecastList.path,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: ForecastListScreen(
                  key: UniqueKey(),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
