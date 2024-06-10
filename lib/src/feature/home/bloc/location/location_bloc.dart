import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:emehanica_test/src/feature/home/repository/location_repository.dart';
import 'package:emehanica_test/src/core/dependency_injection.dart';
import 'package:emehanica_test/src/core/utils/log.dart';
import 'package:emehanica_test/src/core/utils/capitalize_first_letter.dart';

part 'location_event.dart';
part 'location_state.dart';

/// Bloc для управления данными о местоположении пользователя.
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final _locationRepository = locator<LocationRepository>();

  LocationBloc() : super(LocationInitial()) {
    on<SaveLocationEvent>(_onSaveLocationEvent);
    on<GetSavedLocationEvent>(_onGetSavedLocationEvent);
  }

  /// Обработчик события сохранения местоположения.
  Future<void> _onSaveLocationEvent(
    SaveLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    try {
      // Сохранение местоположения через репозиторий.
      await _locationRepository
          .saveLocation(capitalizeFirstLetter(event.cityName.trim()));

      // Получение сохраненного местоположения и отправка состояния.
      final location = await _locationRepository.getSavedLocation();

      //навигация после сохранения локации
      event.navigate();

      //отправка состояния
      emit(LocationLoaded(location: location));
    } catch (e) {
      // В случае ошибки, логируем её и отправляем состояние с ошибкой.
      logger.d(e);
      emit(LocationError(message: e.toString()));
    }
  }

  /// Обработчик события получения сохраненного местоположения.
  Future<void> _onGetSavedLocationEvent(
    LocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    try {
      // Получение сохраненного местоположения и отправка состояния.
      final location = await _locationRepository.getSavedLocation();
      emit(LocationLoaded(location: location));
    } catch (e) {
      // В случае ошибки, отправляем состояние с ошибкой.
      emit(LocationError(message: e.toString()));
    }
  }
}
