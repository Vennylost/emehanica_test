import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:emehanica_test/src/core/models/weather_model.dart';
import 'package:emehanica_test/src/core/utils/get_sorted_forecasts.dart';
import 'package:emehanica_test/src/feature/forecast_list/repository/forecast_list_repository.dart';
import 'package:emehanica_test/src/core/dependency_injection.dart';
import 'package:emehanica_test/src/feature/home/repository/location_repository.dart';
import 'package:emehanica_test/src/core/utils/log.dart';

part 'forecast_list_event.dart';
part 'forecast_list_state.dart';

/// Bloc для управления состоянием списка прогнозов.
class ForecastListBloc extends Bloc<ForecastListEvent, ForecastListState> {
  final _forecastListRepository = locator<ForecastListRepository>();
  final _locationRepository = locator<LocationRepository>();

  ForecastListBloc() : super(ForecastListInitial()) {
    on<GetForecastListEvent>(_onGetForecastListEvent);
  }

  /// Обработчик события получения списка погоды.
  ///
  /// При получении события [GetForecastListEvent] этот метод загружает
  /// сохранённое местоположение и получает список погоды за три дня для этого местоположения.
  /// Если местоположение не сохранено, генерируется ошибка.
  Future<void> _onGetForecastListEvent(
    GetForecastListEvent event,
    Emitter<ForecastListState> emit,
  ) async {
    emit(
      ForecastListLoading(),
    );
    try {
      //Получение сохранённой локации, null если ничего не сохранено
      final location = await _locationRepository.getSavedLocation();

      if (location != null) {
        //получение списка прогнозов
        final forecastList = await _forecastListRepository.getForecastList(
          location,
        );

        //Получение списка отсортированных прогнозов и отправка состояния
        emit(
          ForecastListLoaded(
            forecastList: getSortedForecasts(forecastList),
          ),
        );
      } else {
        //Генерация ошибки если локация не сохранена
        throw Exception('There is no saved location');
      }
    } catch (e) {
      // В случае ошибки, логируем её и отправляем соответствующее состояние.
      logger.d(e);
      emit(ForecastListError(message: e.toString()));
    }
  }
}
