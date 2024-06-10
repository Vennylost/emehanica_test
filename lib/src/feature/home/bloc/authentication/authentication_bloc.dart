import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:emehanica_test/src/core/dependency_injection.dart';
import 'package:emehanica_test/src/feature/home/models/user.dart';
import 'package:emehanica_test/src/feature/home/repository/authentication_repository.dart';
import 'package:emehanica_test/src/core/utils/log.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

/// Bloc для управления аутентификацией пользователя.
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final _authenticationRepository = locator<AuthenticationRepository>();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<CreateUserEvent>(_onCreateUserEvent);
    on<GetAuthenticationStatus>(_onGetAuthenticationStatus);
  }

  /// Обработчик события создания пользователя.
  ///
  /// При получении события [CreateUserEvent] этот метод создает пользователя
  Future<void> _onCreateUserEvent(
    CreateUserEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      // Создание пользователя через репозиторий.
      await _authenticationRepository.createUser(
        User(
          password: event.password,
          email: event.email,
          username: event.username,
        ),
      );

      //Авторизация пользователя через репозиторий
      await _authenticationRepository.authenticate(
        User(
          password: event.password,
          email: event.email,
          username: event.username,
        ),
      );

      // Отправка состояния успешной аутентификации.
      emit(AuthenticationSuccess());
    } catch (e) {
      // В случае ошибки, логируем её и отправляем состояние с ошибкой.
      logger.d(e);
      emit(AuthenticationFailure(message: e.toString()));
    }
  }

  /// Обработчик получения статуса об авторизации пользователя
  ///
  /// При получении события [GetAuthenticationStatus] этот метод определяет
  /// авторизирован пользователь или нет
  ///
  Future<void> _onGetAuthenticationStatus(
    GetAuthenticationStatus event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      // получение статуса об авторизации
      final isAuthenticated =
          await _authenticationRepository.isUserAuthenticated();

      //Отправка состояния об успешной авторизации если пользователь авторзироан, если нет - состояние об отсутствии авторизации
      isAuthenticated
          ? emit(AuthenticationSuccess())
          : emit(NotAuthenticatedState());
    } catch (e) {
      // В случае ошибки, логируем её и отправляем состояние с ошибкой.
      logger.d(e);
      emit(AuthenticationFailure(message: e.toString()));
    }
  }
}
