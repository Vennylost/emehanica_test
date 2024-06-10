import 'package:easy_localization/easy_localization.dart';
import 'package:emehanica_test/src/core/dependency_injection.dart';
import 'package:emehanica_test/src/feature/app/presentation/app_root.dart';
import 'package:flutter/material.dart';
import 'package:emehanica_test/src/core/translations/codegen_loader.g.dart';
import 'package:flutter/services.dart';

void main() async {
  // Убеждаемся, что инициализация виджетов выполнена перед запуском приложения
  WidgetsFlutterBinding.ensureInitialized();

  // Выполняем настройку локаторов для внедрения зависимостей
  setUpLocators();

  // Устанавливаем предпочтительные ориентации экрана (вертикальные)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Запускаем приложение, обернутое в EasyLocalization для поддержки локализации
  runApp(
    EasyLocalization(
      // Путь к файлам с переводами
      path: 'assets/translations',
      // Поддерживаемые локали
      supportedLocales: const [Locale('ru')],
      // Локаль, с которой начинается приложение
      startLocale: const Locale('ru'),
      // Резервная локаль, используется, если запрошенная локаль недоступна
      fallbackLocale: const Locale('ru'),
      // Загрузчик ресурсов, использующий генерацию кода для улучшения производительности
      assetLoader: const CodegenLoader(),
      // Использовать только код языка для определения локали
      useOnlyLangCode: true,
      // Корневой виджет приложения
      child: const AppRoot(),
    ),
  );
}
