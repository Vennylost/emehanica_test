// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastListModel _$ForecastListModelFromJson(Map<String, dynamic> json) =>
    ForecastListModel(
      list: (json['list'] as List<dynamic>)
          .map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastListModelToJson(ForecastListModel instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
