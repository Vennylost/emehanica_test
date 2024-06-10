import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:emehanica_test/src/core/translations/locale_keys.g.dart';
import 'package:emehanica_test/src/ui_kit/app_icon_button/widget/app_icon_button.dart';
import 'package:emehanica_test/src/ui_kit/app_error_widget/theme/theme.dart';

/// Виджет для отображения сообщения об ошибке и кнопки повтора.
class AppErrorWidget extends StatelessWidget {
  /// Callback-функция для повторной попытки.
  final VoidCallback onRetry;

  /// Создает экземпляр [AppErrorWidget].
  const AppErrorWidget({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.dataAcquisitionError.tr(),
            style: ErrorTheme.text.messageTextStyle,
          ),
          const Gap(8),
          AppIconButton(
            onTap: onRetry,
            child: Text(
              LocaleKeys.retry.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
