import 'package:json_annotation/json_annotation.dart';

// Директива part для включения сгенерированного кода сериализации
part 'user.g.dart';

/// Модель пользователя.
@JsonSerializable()
class User {
  final String password;
  final String email;
  final String username;

  /// Конструктор.
  User({
    required this.password,
    required this.email,
    required this.username,
  });

  /// Метод для преобразования экземпляра класса в JSON.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
