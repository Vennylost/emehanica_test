import 'package:json_annotation/json_annotation.dart';

// Директива part для включения сгенерированного кода сериализации
part 'weather_model.g.dart';

/// Модели для получения данных о погоде

@JsonSerializable()
class WeatherModel {
  final List<Weather> weather;
  final Main main;
  final Wind wind;
  final int dt;

  /// Преобразует метку времени в объект [DateTime]
  DateTime get dateTime => DateTime.fromMillisecondsSinceEpoch(dt * 1000);

  WeatherModel(
    this.dt, {
    required this.weather,
    required this.main,
    required this.wind,
  });

  /// Создает экземпляр [ WeatherModel] из JSON.
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@JsonSerializable()
class Weather {
  final String description;
  final String icon;

  Weather({
    required this.description,
    required this.icon,
  });

  /// Создает экземпляр [Weather] из JSON.
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@JsonSerializable()
class Main {
  final double temp;
  final int humidity;

  Main({
    required this.temp,
    required this.humidity,
  });

  /// Создает экземпляр [Main] из JSON.
  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@JsonSerializable()
class Wind {
  final double speed;

  Wind({
    required this.speed,
  });

  /// Создает экземпляр [Wind] из JSON.
  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
