// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ru = {
    "enterCity": "Введите город",
    "logIn": "Авторизоваться",
    "password": "Пароль",
    "username": "Имя пользователя",
    "email": "Почта",
    "search": "Поиск",
    "forecastFor3Days": "Прогноз за 3 дня",
    "dataAcquisitionError": "Ошибка получения данных",
    "uncorrectedEmail": "Неверная почта",
    "retry": "Повторить",
    "required": "Обязательное поле",
    "minLength": {
      "one": "{} символ минимум",
      "two": "{} символа минимум",
      "few": "{} символов минимум",
      "many": "{} символов минимум",
      "other": "{} символов минимум"
    },
    "ms": "{} м/с",
    "cel": "{} °C",
    "per": "{} %"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {"ru": ru};
}
