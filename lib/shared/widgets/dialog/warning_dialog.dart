import 'package:flutter/material.dart';
import 'package:moli_app/constants/icon_assets.dart';
import 'package:moli_app/shared/shared.dart';

extension WarningDialog on BuildContext {
  Future<bool> showWarnigDialog<T>({
    Widget? image,
    required Widget title,
    required Widget content,
    Widget? negative,
    Widget? positive,
    double? dialogWidth,
  }) async {
    final bool? result = await showDialog<bool>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.all(24),
          content: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (image != null) ...<Widget>[
                    Center(child: image),
                  ],
                  DefaultTextStyle(
                    style: textTheme.headlineSmall!.weight500,
                    child: title,
                  ),
                  DefaultTextStyle(
                    style: textTheme.bodyMedium!,
                    child: content,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AppTextButton(
                            primary: colorScheme.onSecondaryContainer,
                            child: negative ?? Text(l10n.cancel),
                            onPressed: () =>
                                Navigator.of(context, rootNavigator: true)
                                    .pop(false)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: AppElevatedButton(
                            primary: colorScheme.error,
                            child: positive ?? Text(l10n.confirm),
                            onPressed: () =>
                                Navigator.of(context, rootNavigator: true)
                                    .pop(true)),
                      ),
                    ],
                  )
                ].applySeparator(separator: const SizedBox(height: 16)),
              ),
              Positioned(
                  top: -16,
                  right: -16,
                  child: GestureDetector(
                      onTap: () =>
                          Navigator.of(context, rootNavigator: true).pop(false),
                      child: const AppIcon(IconAssets.icCloseCircle, size: 24)
                          .paddingAll(8)))
            ],
          ),
        );
      },
    );

    await Future<void>.delayed(const Duration(milliseconds: 500));

    return result ?? false;
  }
}
