import 'package:emehanica_test/src/feature/detailed_forecast/repository/detailed_forecast_repository.dart';
import 'package:emehanica_test/src/feature/forecast_list/repository/forecast_list_repository.dart';
import 'package:emehanica_test/src/feature/home/repository/authentication_repository.dart';
import 'package:emehanica_test/src/feature/home/repository/location_repository.dart';
import 'package:get_it/get_it.dart';

/// Экземпляр `GetIt`, используемый для управления зависимостями
GetIt locator = GetIt.instance;

/// Настройка локаторов для управления зависимостями
///
/// Эта функция регистрирует зависимости, используя ленивую инициализацию
/// для следующих репозиториев:
/// - [AuthenticationRepository]
/// - [LocationRepository]
/// - [ForecastListRepository]
/// - [DetailedForecastRepository]
///
/// Каждый репозиторий будет создан только тогда, когда он будет запрошен впервые.
void setUpLocators() {
  locator.registerLazySingleton(() => AuthenticationRepository());
  locator.registerLazySingleton(() => LocationRepository());
  locator.registerLazySingleton(() => ForecastListRepository());
  locator.registerLazySingleton(() => DetailedForecastRepository());
}
