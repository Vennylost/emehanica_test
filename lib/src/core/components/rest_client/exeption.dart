abstract class RestClientException implements Exception {
  //Сообщение ошибки
  final String message;

  // Статус код ошибки (если есть)
  final int? statusCode;

  const RestClientException({required this.message, this.statusCode});
}

//Ошибка на стороне клиента
final class ClientException extends RestClientException {
  const ClientException({
    required super.message,
    super.statusCode,
    this.cause,
  });

  //Причина ошибки
  final Object? cause;

  @override
  String toString() => 'ClientException('
      'message: $message, '
      'statusCode: $statusCode, '
      'cause: $cause'
      ')';
}

//Кастомная ошибка бэкенда
final class CustomBackendException extends RestClientException {
  const CustomBackendException({
    required super.message,
    super.statusCode,
  });

  @override
  String toString() => 'CustomBackendException('
      'message: $message, '
      'statusCode: $statusCode, '
      ')';
}

//Ошибка соединения
final class ConnectionException extends RestClientException {
  const ConnectionException({
    required super.message,
    super.statusCode,
  });

  @override
  String toString() => 'ConnectionException('
      'message: $message, '
      'statusCode: $statusCode, '
      ')';
}
