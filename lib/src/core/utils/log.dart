import 'package:logger/logger.dart';

// Возвращает экземпляр логгера.
Logger get logger => Log.instance;

// Реализация логгера с использованием пакета logger.
class Log extends Logger {
  Log._() : super(printer: PrettyPrinter(printTime: true));

  // Единственный экземпляр логгера.
  static final instance = Log._();
}
