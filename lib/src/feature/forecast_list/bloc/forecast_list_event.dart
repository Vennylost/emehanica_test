part of 'forecast_list_bloc.dart';

/// События, связанные с списком прогнозов.
///
/// Класс, используемый для определения всех событий, связанных со списком прогнозов.
sealed class ForecastListEvent extends Equatable {
  const ForecastListEvent();
}

/// Событие получения списка прогнозов
///
/// Это событие инициирует запрос на получение списка прогнозов.
final class GetForecastListEvent extends ForecastListEvent {
  @override
  List<Object> get props => [];
}
