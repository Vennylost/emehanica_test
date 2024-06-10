import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:emehanica_test/src/core/dependency_injection.dart';
import 'package:emehanica_test/src/core/models/weather_model.dart';
import 'package:emehanica_test/src/feature/detailed_forecast/repository/detailed_forecast_repository.dart';
import 'package:emehanica_test/src/feature/home/repository/location_repository.dart';
import 'package:emehanica_test/src/core/utils/log.dart';

part 'detailed_forecast_event.dart';
part 'detailed_forecast_state.dart';

/// BLoC для управления детальным прогнозом.
///
/// Этот BLoC загружает детальный прогноз для указанных координат местоположения.
class DetailedForecastBloc
    extends Bloc<DetailedForecastEvent, DetailedForecastState> {
  final _detailedForecastRepository = locator<DetailedForecastRepository>();
  final _locationRepository = locator<LocationRepository>();
  DetailedForecastBloc() : super(DetailedForecastInitial()) {
    on<GetDetailedForecastEvent>(_onGetDetailedForecastEvent);
  }

  /// Обработчик события получения детального прогноза.
  ///
  /// При получении события [GetDetailedForecastEvent] этот метод загружает
  /// сохранённое местоположение и получает детальный прогноз погоды для этого местоположения.
  /// Если местоположение не сохранено, генерируется ошибка.
  Future<void> _onGetDetailedForecastEvent(
    GetDetailedForecastEvent event,
    Emitter<DetailedForecastState> emit,
  ) async {
    emit(
      DetailedForecastLoading(),
    );
    try {
      //Получение сохранённой локации, null если ничего не сохранено
      final location = await _locationRepository.getSavedLocation();

      if (location != null) {
        //получение детального прогноза
        final detailedForecast =
            await _detailedForecastRepository.getDetailedForecast(
          location,
        );

        //Отправка состояния с детальным прогнозом
        emit(DetailedForecastLoaded(detailedForecast: detailedForecast));
      } else {
        throw Exception('There is no saved location');
      }
    } catch (e) {
      // Логирование ошибки
      logger.d(e);

      // Отправка состояния ошибки с сообщением об ошибке
      emit(DetailedForecastError(message: e.toString()));
    }
  }
}
