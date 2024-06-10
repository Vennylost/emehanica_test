import 'package:emehanica_test/src/feature/detailed_forecast/theme/theme.dart';
import 'package:flutter/material.dart';

/// Базовый виджет строки приложения, который реализует PreferredSizeWidget.
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Заголовок строки приложения.
  final Widget? title;

  const BaseAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: DetailedForecastTheme.color.appBarColor,
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
