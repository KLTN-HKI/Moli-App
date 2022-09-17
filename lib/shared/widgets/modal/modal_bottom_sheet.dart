import 'package:flutter/material.dart';
import '../../shared.dart';

extension ModalHelper on BuildContext {
  Future<T?> showDefaultModal<T>({
    required WidgetBuilder builder,
  }) async {
    return showModalBottomSheet<T>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      context: this,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height * .8,
            maxWidth: width,
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 4,
                    width: 24,
                    margin: const EdgeInsets.only(top: 12, bottom: 8),
                    decoration: BoxDecoration(
                      color: colorScheme.outline,
                      // set border width
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                ),
                Flexible(child: builder(context)),
              ],
            ),
          ),
        );
      },
    );
  }
}
