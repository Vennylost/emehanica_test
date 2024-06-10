part of 'detailed_forecast_bloc.dart';

/// Состояния, связанные с детальным прогнозом.
///
/// Класс, используемый для определения всех состояний, связанных с детальным прогнозом.
sealed class DetailedForecastState extends Equatable {
  const DetailedForecastState();
}

/// Начальное состояние детального прогноза.
class DetailedForecastInitial extends DetailedForecastState {
  @override
  List<Object> get props => [];
}

/// Состояние загрузки детального прогноза.
class DetailedForecastLoading extends DetailedForecastState {
  @override
  List<Object> get props => [];
}

/// Состояние, когда детальный прогноз успешно загружен.
class DetailedForecastLoaded extends DetailedForecastState {
  final WeatherModel detailedForecast;

  const DetailedForecastLoaded({required this.detailedForecast});

  @override
  List<Object> get props => [detailedForecast];
}

/// Состояние, когда возникла ошибка при загрузке детального прогноза.
class DetailedForecastError extends DetailedForecastState {
  final String message;

  const DetailedForecastError({required this.message});
  @override
  List<Object> get props => [message];
}
