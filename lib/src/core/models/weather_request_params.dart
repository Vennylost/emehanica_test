import 'package:json_annotation/json_annotation.dart';

// Директива part для включения сгенерированного кода сериализации
part 'weather_request_params.g.dart';

/// Модель параметров для запроса к API
@JsonSerializable()
class WeatherRequestParams {
  final String q;
  final String appid;
  final String units;
  final String lang;
  final int? cnt;

  WeatherRequestParams({
    required this.q,
    required this.appid,
    required this.units,
    required this.lang,
    this.cnt,
  });

  /// Создает экземпляр [WeatherRequestParams] из JSON.
  Map<String, dynamic> toJson() => _$WeatherRequestParamsToJson(this);
}
