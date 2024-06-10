part of 'authentication_bloc.dart';

/// Состояния, связанные с авторизацией пользователя
///
/// Класс, используемый для определения всех состояний, связанных с авторизацией пользователя
sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
}

/// Начальное состояние авторизации пользователя
final class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

///Состояние успешной авторизации пользователя
final class AuthenticationSuccess extends AuthenticationState {
  @override
  List<Object> get props => [];
}

///Сотстояние, когда возникла ошибка
final class AuthenticationFailure extends AuthenticationState {
  final String message;

  const AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}

///Состояние отсутсвия авторизации
final class NotAuthenticatedState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
