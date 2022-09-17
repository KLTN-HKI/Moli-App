import 'package:flutter/material.dart';

import '../../shared.dart';

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
          contentPadding: const EdgeInsets.fromLTRB(
            16,
            24,
            16,
            12,
          ),
          content: SizedBox(
            width: dialogWidth ?? context.width * .85,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.start,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              children: <Widget>[
                if (image != null) ...<Widget>[
                  Center(child: image),
                  SizedBox(height: 24.w),
                ],
                DefaultTextStyle(
                  style: context.textTheme.titleLarge!,
                  child: title,
                ),
                SizedBox(height: 8.w),
                DefaultTextStyle(
                  style: context.textTheme.bodyLarge!,
                  child: content,
                ),
                SizedBox(height: 8.w),
                ...actions
                    .applySeparator(
                      separator: SizedBox(height: 8.w),
                    )
                    .toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
