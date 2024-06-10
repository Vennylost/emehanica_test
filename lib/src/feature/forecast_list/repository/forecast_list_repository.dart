import 'package:emehanica_test/src/core/models/weather_model.dart';
import 'package:emehanica_test/src/core/models/weather_request_params.dart';
import 'package:emehanica_test/src/feature/forecast_list/models/forecast_list_model.dart';
import 'package:emehanica_test/src/core/components/rest_client/rest_client_dio.dart';
import 'package:emehanica_test/src/core/constants/constants.dart';

/// Репозиторий для получения списка прогнозов погоды.
class ForecastListRepository {
  final _restClient = RestClientDio(AppConstants.openWeatherDomain);
  static const _numberOfTimestamps = 24;
  final _forecastQuery = '\\forecast';

  /// Получает список прогнозов погоды для указанного местоположения.
  Future<List<WeatherModel>> getForecastList(String location) async {
    try {
      //Получение ответа из GET запроса
      final response = await _restClient.get(
        '${AppConstants.weatherDataPath}$_forecastQuery',
        queryParams: WeatherRequestParams(
          q: location,
          appid: AppConstants.weatherApiKey,
          units: AppConstants.units,
          lang: AppConstants.lang,
          cnt: _numberOfTimestamps,
        ).toJson(),
      );

      //преобразование в ForecastListModel из JSON
      final forecastList = ForecastListModel.fromJson(
        response.data as Map<String, dynamic>,
      );

      //возвращение результата
      return forecastList.list;
    } on Exception catch (_) {
      // Повторное возбуждение исключения для передачи его выше по стеку вызовов.
      rethrow;
    }
  }
}
