import 'package:shared_preferences/shared_preferences.dart';

/// Репозиторий для работы с сохраненным местоположением.
class LocationRepository {
  final _locationKey = 'location';

  /// Сохраняет местоположение в хранилище.
  ///
  /// [name] - название местоположения для сохранения.
  Future<void> saveLocation(String name) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString(_locationKey, name);
    } on Exception catch (_) {
      rethrow;
    }
  }

  /// Получает сохраненное местоположение из хранилища.
  ///
  /// Возвращает [String] с сохраненным местоположением.
  Future<String?> getSavedLocation() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final location = prefs.getString(_locationKey);

      return location;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
