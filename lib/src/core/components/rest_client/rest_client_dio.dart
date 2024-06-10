import 'package:dio/dio.dart';
import 'package:emehanica_test/src/core/components/rest_client/exeption.dart';

/// Класс для работы с REST API с использованием Dio
class RestClientDio {
  final Dio _apiManager; // Экземпляр класса Dio для управления запросами

  // Конструктор класса, принимающий базовый URL
  RestClientDio(String baseUrl)
      : _apiManager = Dio(
          BaseOptions(baseUrl: baseUrl),
        ); // Инициализация Dio с базовым URL

  /// Функция для отправки запроса
  Future<Response> _sendRequest<T extends Object>({
    required String path, // Путь запроса
    required String
        method, // Метод запроса (GET, POST, PUT, DELETE, PATCH и т. д.)
    Map<String, Object?>? body, // Тело запроса
    Map<String, Object?>? headers, // Заголовки запроса
    Map<String, Object?>? queryParams, // Параметры запроса
  }) async {
    try {
      // Опции запроса (заголовки, тип контента и т. д.)
      final options = Options(
        headers: headers,
        method: method,
        contentType: 'application/json',
        responseType: ResponseType.json,
      );

      // Выполнение запроса с использованием Dio
      final response = await _apiManager.request<T>(
        path,
        data: body,
        options: options,
        queryParameters: queryParams,
      );

      return response; // Возвращаем результат запроса
    } on DioException catch (e) {
      // Обработка исключений Dio
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        // Обработка ошибки подключения или тайм-аута
        Error.throwWithStackTrace(
          ConnectionException(
            message: 'ConnectionException',
            statusCode: e.response?.statusCode,
          ),
          e.stackTrace,
        );
      }
      if (e.response?.statusCode == 400) {
        // Обработка ошибки с кодом состояния 400 (неправильный запрос)
        Error.throwWithStackTrace(
          CustomBackendException(
            message: 'CustomBackendException',
            statusCode: e.response?.statusCode,
          ),
          e.stackTrace,
        );
      }
      if (e.response != null) {
        // Возвращаем ответ, если он был получен, но с ошибкой
        return e.response!;
      }
      // Если нет ответа, генерируем исключение клиента
      Error.throwWithStackTrace(
        ClientException(
          message: e.toString(),
          statusCode: e.response?.statusCode,
          cause: e,
        ),
        e.stackTrace,
      );
    } on Object catch (e, stack) {
      // Обработка других исключений
      Error.throwWithStackTrace(
        ClientException(message: e.toString(), cause: e),
        stack,
      );
    }
  }

  /// Функция для выполнения GET-запроса
  Future<Response> get(
    String path, {
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) =>
      _sendRequest(
        path: path,
        method: 'GET',
        headers: headers,
        queryParams: queryParams,
      );

  /// Функция для выполнения PUT-запроса
  Future<Response> put(
    String path, {
    required Map<String, Object?> body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) =>
      _sendRequest(
        path: path,
        method: 'PUT',
        body: body,
        headers: headers,
        queryParams: queryParams,
      );

  /// Функция для выполнения POST-запроса
  Future<Response> post(
    String path, {
    required Map<String, Object?> body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) =>
      _sendRequest(
        path: path,
        method: 'POST',
        body: body,
        headers: headers,
        queryParams: queryParams,
      );
}
