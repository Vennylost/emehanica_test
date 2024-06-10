import 'package:emehanica_test/src/feature/home/bloc/authentication/authentication_bloc.dart';
import 'package:emehanica_test/src/feature/home/bloc/location/location_bloc.dart';
import 'package:emehanica_test/src/feature/home/presentation/widgets/forecast_form.dart';
import 'package:emehanica_test/src/feature/home/presentation/widgets/log_in_form.dart';
import 'package:emehanica_test/src/ui_kit/app_snack_bar/widget/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Главный экран приложения.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: MultiBlocListener(
        listeners: [
          // Слушатель состояний аутентификации для отображения сообщений об ошибке.
          BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationFailure) {
                AppSnackBar.show(context, state.message);
              }
            },
          ),
          // Слушатель состояний местоположения для отображения сообщений об ошибке.
          BlocListener<LocationBloc, LocationState>(
            listener: (context, state) {
              if (state is LocationError) {
                AppSnackBar.show(context, state.message);
              }
            },
          ),
        ],
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) => state is AuthenticationSuccess
              ? BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, state) {
                    //если авторизация прошла успешно, отображение поля для ввода локации
                    final locationController = TextEditingController(
                      text: state is LocationLoaded ? state.location : null,
                    );
                    return ForecastForm(
                      controller: locationController,
                    );
                  },
                )
              :
              //если нет, отображение поля для авторизации
              LogInForm(),
        ),
      ),
    );
  }
}
