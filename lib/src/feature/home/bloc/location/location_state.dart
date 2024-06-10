part of 'location_bloc.dart';

/// Состояния, связанные с локацией
///
/// Класс, используемый для определения всех состояний, связанных с локацией
sealed class LocationState extends Equatable {
  const LocationState();
}

/// Начальное состояние локации
final class LocationInitial extends LocationState {
  @override
  List<Object> get props => [];
}

/// Состояние, когда локация загружена
class LocationLoaded extends LocationState {
  final String? location;

  const LocationLoaded({required this.location});

  @override
  List<Object?> get props => [location];
}

/// Состояние, когда возникла ошибка при загрузке локации
class LocationError extends LocationState {
  final String message;

  const LocationError({required this.message});
  @override
  List<Object> get props => [message];
}
