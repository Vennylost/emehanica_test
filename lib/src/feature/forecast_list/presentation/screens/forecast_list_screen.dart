import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:emehanica_test/src/core/translations/locale_keys.g.dart';
import 'package:emehanica_test/src/feature/forecast_list/bloc/forecast_list_bloc.dart';
import 'package:emehanica_test/src/feature/forecast_list/presentation/widgets/forecast_item.dart';
import 'package:emehanica_test/src/feature/forecast_list/theme/theme.dart';
import 'package:emehanica_test/src/ui_kit/app_error_widget/widget/app_error_widget.dart';
import 'package:emehanica_test/src/ui_kit/app_snack_bar/widget/app_snack_bar.dart';

/// Экран списка прогнозов на 3 дня.
class ForecastListScreen extends StatelessWidget {
  const ForecastListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForecastListBloc()
        ..add(
          GetForecastListEvent(), //Отправка события для получения списка прогнозов
        ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          children: [
            // Заголовок списка прогнозов на 3 дня.
            Text(
              LocaleKeys.forecastFor3Days.tr(),
              style: ForecastListTheme.text.headerTextStyle,
            ),
            const Gap(16),
            BlocConsumer<ForecastListBloc, ForecastListState>(
              listener: (BuildContext context, ForecastListState state) {
                // Показываем Snackbar в случае ошибки.
                if (state is ForecastListError) {
                  AppSnackBar.show(context, state.message);
                }
              },
              builder: (context, state) => state is ForecastListLoaded
                  //отображение списка прогнозов
                  ? ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.forecastList.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                        color: ForecastListTheme.color.separatorColor,
                        height: 16,
                        indent: 0,
                        thickness: 1,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          ForecastItem(
                        weather: state.forecastList[index],
                      ),
                    )
                  : state is ForecastListError
                      ? AppErrorWidget(
                          // В случае ошибки показываем виджет ошибки с возможностью повторного запроса.
                          onRetry: () => context.read<ForecastListBloc>()
                            ..add(
                              GetForecastListEvent(),
                            ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
