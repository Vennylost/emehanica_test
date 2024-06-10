import 'package:emehanica_test/src/feature/home/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Репозиторий для авторизации пользователя
class AuthenticationRepository {
  // final _restClient = RestClientDio(AppConstants.authDomain);
  // final _authQuery = '/auth/token';
  final _authenticationKey = 'isAuthenticated';

  /// Метод для авторизации пользователя
  Future<void> authenticate(User user) async {
    try {
      // final response = await _restClient.post(_authQuery, body: user.toJson());
      //
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      //
      // if (response.statusCode == 200) {
      //   prefs.setBool(_authenticationKey, true);
      // } else {
      //   prefs.setBool(_authenticationKey, false);
      // }
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      //сохранение в хранилище, информацию о том, авторизирован ли пользователь
      prefs.setBool(_authenticationKey, true);
    } on Exception catch (_) {
      rethrow;
    }
  }

  /// Метод для создания пользователя
  Future<void> createUser(User user) async {
    try {
      // await _restClient.put(_authQuery, body: user.toJson());
    } on Exception catch (_) {
      rethrow;
    }
  }

  /// Метод для получения информации о том, авторизирован ли пользователь
  Future<bool> isUserAuthenticated() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      //получние из хранилища информацию о том, авторизирован ли пользователь
      return prefs.containsKey(_authenticationKey);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
