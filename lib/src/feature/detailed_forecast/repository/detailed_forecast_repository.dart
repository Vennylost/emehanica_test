import 'package:emehanica_test/src/core/models/weather_model.dart';
import 'package:emehanica_test/src/core/models/weather_request_params.dart';
import 'package:emehanica_test/src/core/components/rest_client/rest_client_dio.dart';
import 'package:emehanica_test/src/core/constants/constants.dart';

/// Репозиторий для получения детального прогноза погоды.
class DetailedForecastRepository {
  final _restClient = RestClientDio(AppConstants.openWeatherDomain);
  final _weatherQuery = '\\weather';

  /// Получает детальный прогноз погоды для указанных координат.
  ///
  /// Возвращает модель [WeatherModel], содержащую информацию о погоде.
  Future<WeatherModel> getDetailedForecast(String location) async {
    try {
      //получение ответа из GET запроса
      final response = await _restClient.get(
        '${AppConstants.weatherDataPath}$_weatherQuery',
        queryParams: WeatherRequestParams(
          q: location,
          appid: AppConstants.weatherApiKey,
          units: AppConstants.units,
          lang: AppConstants.lang,
        ).toJson(),
      );

      //преобразование из JSON в WeatherModel
      final detailedForecast = WeatherModel.fromJson(
        response.data as Map<String, dynamic>,
      );

      //возвращение результата
      return detailedForecast;
    } on Exception catch (_) {
      // Повторное возбуждение исключения для передачи его выше по стеку вызовов.
      rethrow;
    }
  }
}
