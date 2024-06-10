import 'package:emehanica_test/src/core/models/weather_model.dart';
import 'package:json_annotation/json_annotation.dart';

// Директива part для включения сгенерированного кода сериализации
part 'forecast_list_model.g.dart';

/// Модель списка прогнозов.
@JsonSerializable()
class ForecastListModel {
  final List<WeatherModel> list;

  ForecastListModel({required this.list});

  /// Создает экземпляр [ForecastListModel] из JSON.
  factory ForecastListModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastListModelFromJson(json);
}
