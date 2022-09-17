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
            const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 8,
                      width: 24,
                      margin: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.colorScheme.outline,
                        // set border width
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ],
                ),
                child,
              ],
            ),
          ),
        );
      },
    );
  }
}
