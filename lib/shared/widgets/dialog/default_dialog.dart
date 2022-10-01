import 'package:flutter/material.dart';
import 'package:moli_app/shared/shared.dart';

extension DefaultDialog on BuildContext {
  Future<T?> showDefaultDialog<T>({
    Widget? image,
    required Widget title,
    required Widget content,
    List<Widget> actions = const <Widget>[],
    double? radius,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    double? dialogWidth,
  }) {
    return showDialog<T?>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 12),
          ),
          contentPadding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
          content: SizedBox(
            width: dialogWidth ?? width * .85,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.start,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              children: <Widget>[
                if (image != null) ...<Widget>[
                  Center(child: image),
                  const SizedBox(height: 24),
                ],
                DefaultTextStyle(
                  style: textTheme.titleLarge!.weight600,
                  child: title,
                ),
                const SizedBox(height: 8),
                DefaultTextStyle(
                  style: textTheme.bodyLarge!,
                  child: content,
                ),
                const SizedBox(height: 24),
                ...actions
                    .applySeparator(
                        separator: const SizedBox(
                      height: 8,
                    ))
                    .toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
