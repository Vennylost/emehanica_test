part of 'forecast_list_bloc.dart';

/// Состояния, связанные со списком прогнозов
///
/// Класс, используемый для определения всех состояний, связанных со списком прогнозов

sealed class ForecastListState extends Equatable {
  const ForecastListState();
}

/// Начальное состояние списка прогнозов
final class ForecastListInitial extends ForecastListState {
  @override
  List<Object> get props => [];
}

/// Состояние загрузки списка прогнозов
final class ForecastListLoading extends ForecastListState {
  @override
  List<Object> get props => [];
}

/// Состояние, когда список прогнозов успешно загружен.
final class ForecastListLoaded extends ForecastListState {
  final List<WeatherModel> forecastList;

  const ForecastListLoaded({required this.forecastList});

  @override
  List<Object> get props => [forecastList];
}

/// Состояние, когда возникла ошибка при загрузке списка прогнозов.
final class ForecastListError extends ForecastListState {
  final String message;

  const ForecastListError({required this.message});

  @override
  List<Object> get props => [message];
}
