/// Преобразует первую букву строки в заглавную.
///
/// Если строка пуста, возвращает её без изменений.
///
/// Пример:
/// ```dart
/// print(capitalizeFirstLetter("hello")); // "Hello"
/// print(capitalizeFirstLetter("")); // ""
/// ```
///
/// Аргументы:
/// - [input]: строка для преобразования.
///
/// Возвращает:
/// - Строку с заглавной первой буквой.
String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}
