part of 'detailed_forecast_bloc.dart';

/// События, связанные с детальным прогнозом.
///
/// Класс, используемый для определения всех событий, связанных с детальным прогнозом.
class DetailedForecastEvent extends Equatable {
  const DetailedForecastEvent();

  @override
  List<Object> get props => [];
}

/// Событие получения детального прогноза.
///
/// Это событие инициирует запрос на получение детального прогноза.
class GetDetailedForecastEvent extends DetailedForecastEvent {
  @override
  List<Object> get props => [];
}
