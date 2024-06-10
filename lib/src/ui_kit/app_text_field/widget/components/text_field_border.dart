import 'package:flutter/material.dart';

/// Создает границу текстового поля с заданным цветом.
///
/// Параметры:
/// * [color] - цвет границы.
///
/// Возвращает границу текстового поля.
OutlineInputBorder textFieldBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color,
      width: 2,
    ),
  );
}
