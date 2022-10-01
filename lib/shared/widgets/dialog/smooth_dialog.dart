import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../shared.dart';

enum SmoothMode { lottie, network, asset, svg }

enum DialogType { confirmation, error, inform }

class ButtonConfig {
  ButtonConfig({
    this.dialogDone,
    this.dialogCancel,
    this.buttonCancelColor,
    this.buttonDoneColor,
  });

  final String? dialogDone, dialogCancel;
  Color? buttonCancelColor, buttonDoneColor, labelCancelColor, labelDoneColor;
}

class SmoothDialog {
  SmoothDialog({
    required this.context,
    required this.path,
    required this.title,
    required this.content,
    required this.mode,
    this.submit,
    this.onDismiss,
    this.cancel,
    this.buttonConfig,
    this.dialogType,
    this.imageHeight = 150,
    this.imageWidth = 150,
    this.dialogHeight,
    this.dialogWidth,
    this.borderRadius,
    this.backgroundcolor,
  }) {
    buttonConfig ??= ButtonConfig();
    buttonBorderRadius ??= BorderRadius.circular(16);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, Function setState) {
            return AlertDialog(
              backgroundColor:
                  backgroundcolor ?? context.theme.dialogTheme.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(16),
              ),
              contentPadding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
              content: SizedBox(
                width: dialogWidth ?? context.width * .7,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // SizedBox(height: 16),
                    if (mode == SmoothMode.lottie) ...<Widget>[
                      Center(
                        child: Lottie.asset(
                          path,
                          width: imageWidth,
                          height: imageHeight,
                        ),
                      ),
                    ] else if (mode == SmoothMode.asset) ...<Widget>[
                      Image.asset(
                        path,
                        width: imageWidth,
                        height: imageHeight,
                      ),
                    ] else if (mode == SmoothMode.svg) ...<Widget>[
                      Center(
                        child: SvgPicture.asset(
                          path,
                          width: imageWidth,
                          height: imageHeight,
                        ),
                      ),
                    ] else ...<Widget>[
                      Center(
                        child: CachedNetworkImage(
                          imageUrl: path,
                          width: imageWidth,
                          height: imageHeight,
                          progressIndicatorBuilder: (BuildContext context,
                                  String url,
                                  DownloadProgress downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                          errorWidget: (BuildContext context, String url,
                                  dynamic error) =>
                              const Icon(Icons.error),
                        ),
                      )
                    ],
                    const SizedBox(height: 8),
                    AppText.t0(
                      title,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 8),
                    AppText.b0(
                      content,
                      textAlign: TextAlign.center,
                    ),
                    if (dialogType == DialogType.confirmation ||
                        dialogType == DialogType.error)
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          if (dialogType ==
                              DialogType.confirmation) ...<Widget>[
                            buildCancelButton(context),
                            const SizedBox(width: 4),
                          ],
                          buildOkButton(context)
                        ],
                      ).paddingSymmetric(vertical: 12),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      if (onDismiss != null) {
        (onDismiss! as Function())();
      }
    });
  }

  /// lottie, network, asset, svg path
  /// default dialog mode is SmoothMode.lottie
  final String path;

  /// title dialog
  final String title;

  /// content dialog
  final String content;

  /// Dialog's height radius
  /// default is screen width .4
  final double? dialogHeight;

  /// Dialog's width radius
  /// default is screen width .7
  final double? dialogWidth;

  /// Dialog's image height radius
  /// default is 150
  final double imageHeight;

  /// Dialog's image width radius
  /// default is 150
  final double imageWidth;

  final VoidCallback? submit;

  final Function? cancel;

  final Function? onDismiss;

  final BuildContext context;

  final Color? backgroundcolor;

  ButtonConfig? buttonConfig;

  /// Dialog's border radius
  /// default is 12
  final BorderRadius? borderRadius;

  /// button's border radius
  /// default is 12
  BorderRadius? buttonBorderRadius;

  /// default dialog mode is SmoothMode.lottie
  SmoothMode mode = SmoothMode.lottie;

  /// default dialogType mode is SmoothMode.lottie
  DialogType? dialogType = DialogType.confirmation;

  Ink buildOkButton(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: buttonConfig?.buttonDoneColor ?? context.colorScheme.primary,
        borderRadius: buttonBorderRadius,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          if (submit != null) {
            submit!();
          }
        },
        borderRadius: buttonBorderRadius,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: AppText.l0(
            buttonConfig?.dialogDone ?? context.l10n.i_got_it,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w700,
            color:
                buttonConfig?.labelDoneColor ?? context.colorScheme.background,
          ),
        ),
      ),
    );
  }

  Ink buildCancelButton(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color:
            buttonConfig?.buttonCancelColor ?? context.colorScheme.background,
        borderRadius: buttonBorderRadius,
      ),
      child: InkWell(
        onTap: () {
          if (cancel != null) {
            (cancel! as Function())();
          }
          Navigator.pop(context);
        },
        borderRadius: buttonBorderRadius,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: AppText.l0(
            buttonConfig?.dialogCancel ?? context.l10n.cancel,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w700,
            color: buttonConfig?.labelCancelColor ??
                context.colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
