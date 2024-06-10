import 'package:emehanica_test/src/core/models/weather_model.dart';

/// Возвращает список отсортированных прогнозов погоды.
///
/// Эта функция принимает список объектов [WeatherModel], разбивает его на подсписки
/// по 8 элементов, затем выбирает из каждого подсписка прогноз с максимальной температурой.
/// После этого сортирует выбранные прогнозы по возрастанию температуры.
///
/// Аргументы:
/// - [list]: список объектов [WeatherModel] для сортировки.
///
/// Возвращает:
/// - Отсортированный список объектов [WeatherModel] по возрастанию температуры.
List<WeatherModel> getSortedForecasts(List<WeatherModel> list) {
  final List<List<WeatherModel>> splittedList = [];
  final List<WeatherModel> values = [];

  // Разбиваем исходный список на подсписки по 8 элементов
  for (int i = 0; i < list.length; i += 8) {
    splittedList.add(list.sublist(i, i + 8));
  }

  // Для каждого подсписка выбираем прогноз с максимальной температурой
  for (final sublist in splittedList) {
    values.add(
      sublist.reduce(
        (currentMax, next) =>
            currentMax.main.temp > next.main.temp ? currentMax : next,
      ),
    );
  }

  // Сортируем выбранные прогнозы по возрастанию температуры
  values.sort((a, b) => a.main.temp.compareTo(b.main.temp));

  return values;
}
