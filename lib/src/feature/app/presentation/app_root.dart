import 'package:easy_localization/easy_localization.dart';
import 'package:emehanica_test/src/feature/home/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emehanica_test/src/routes/go_router_config.dart';
import 'package:emehanica_test/src/feature/home/bloc/location/location_bloc.dart';

/// Корневой виджет приложения.
///
/// Этот виджет инициализирует настройки локализации приложения с помощью EasyLocalization,
/// настраивает управление маршрутами с помощью GoRouter и предоставляет
/// LocationBloc для его потомков с использованием BlocProvider из Flutter Bloc.
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationBloc()
            ..add(
              GetSavedLocationEvent(),
            ), // вызов события для получения сохранённой локации
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc()
            ..add(
              GetAuthenticationStatus(),
            ), //отправка события для получения статуса об авторизации пользователя,
        ),
      ],
      child: MaterialApp.router(
        // Настройка параметров локализации
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // Настройка управления маршрутами с помощью GoRouter
        routerConfig: buildGoRouter(),
        // Скрытие баннера отладки в режиме релиза
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
