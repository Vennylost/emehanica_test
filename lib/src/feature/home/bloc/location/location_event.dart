part of 'location_bloc.dart';

/// События, связанные с локацией
///
/// Класс, используемый для определения всех событий, связанных с локацией
sealed class LocationEvent extends Equatable {
  const LocationEvent();
}

/// Событие сохранения локации
///
/// Это событие инициирует запрос на сохранение локации на основе названия города
class SaveLocationEvent extends LocationEvent {
  final String cityName;
  final Function() navigate;

  const SaveLocationEvent({required this.cityName, required this.navigate});

  @override
  List<Object> get props => [cityName, navigate];
}

/// Событие получения локации
///
/// Это событие инициирует запрос на получение сохранённой локации
class GetSavedLocationEvent extends LocationEvent {
  @override
  List<Object> get props => [];
}
