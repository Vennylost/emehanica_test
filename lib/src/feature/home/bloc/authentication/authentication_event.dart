part of 'authentication_bloc.dart';

/// События, связанные с авторизацией пользователя.
///
/// Класс, используемый для определения всех событий, связанных с авторизацией пользователя.
sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

/// Событие для создания пользователя
///
/// Это событие инициирует запрос на создание пользователя.
final class CreateUserEvent extends AuthenticationEvent {
  final String email;
  final String username;
  final String password;

  const CreateUserEvent({
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [email, username, password];
}

/// Событие получения статуса авторизации
///
/// Это событие инициирует запрос на получение статуса авторизации.
final class GetAuthenticationStatus extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}
