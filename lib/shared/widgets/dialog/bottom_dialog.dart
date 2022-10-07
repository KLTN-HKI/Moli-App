import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared.dart';

extension BottomModal on BuildContext {
  Future<T?> showDefaultBottomModal<T>({
    required Widget child,
    BorderRadius? borderRadius,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    EdgeInsets? padding,
  }) async {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ??
            const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      context: this,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: padding ?? context.mediaQueryViewInsets,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossAxisAlignment,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: FractionallySizedBox(
                    widthFactor: 0.1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: 8,
                      decoration: BoxDecoration(
                        color: colorScheme.outline,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                ),
                child,
              ],
            ),
          ),
        );
      },
    );
  }

  Future<T?> showCupertinoDialog<T>({
    Widget? image,
    Widget? title,
    Widget? content,
    List<Widget> actions = const <Widget>[],
    double? radius,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    double? dialogHeight,
    Widget? child,
    bool barrierDismissible = true,
  }) {
    assert((title != null && content != null) || child != null,
        'Dialog must have title - context not null or child not null');

    child ??= Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: FractionallySizedBox(
            widthFactor: 0.1,
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: colorScheme.outline,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        if (image != null) ...<Widget>[
          Center(child: image),
          const SizedBox(height: 24),
        ],
        DefaultTextStyle(
          style: textTheme.titleLarge!.weight600,
          child: title!,
        ),
        const SizedBox(height: 16),
        Expanded(
          child: DefaultTextStyle(
            style: textTheme.bodyLarge!,
            child: content!,
          ),
        ),
        const SizedBox(height: 24),
        ...actions
            .applySeparator(separator: const SizedBox(height: 8))
            .toList(),
        const SizedBox(height: 16),
      ],
    );

    return showCupertinoModalPopup<T>(
        context: this,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) => GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                height: dialogHeight ?? context.height * 0.35,
                width: context.width,
                padding: const EdgeInsets.all(8),
                // The Bottom margin is provided to align the popup above the system navigation bar.
                margin: context.mediaQueryViewInsets,
                // Provide a background color for the popup.
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBackground.resolveFrom(context),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                // Use a SafeArea widget to avoid system overlaps.
                child: SafeArea(top: false, child: child!),
              ),
            ));
  }
}
