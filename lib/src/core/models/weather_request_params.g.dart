// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherRequestParams _$WeatherRequestParamsFromJson(
        Map<String, dynamic> json) =>
    WeatherRequestParams(
      q: json['q'] as String,
      appid: json['appid'] as String,
      units: json['units'] as String,
      lang: json['lang'] as String,
      cnt: (json['cnt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WeatherRequestParamsToJson(
        WeatherRequestParams instance) =>
    <String, dynamic>{
      'q': instance.q,
      'appid': instance.appid,
      'units': instance.units,
      'lang': instance.lang,
      'cnt': instance.cnt,
    };
