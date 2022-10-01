import 'package:flutter/material.dart';
import 'package:moli_app/config/config.dart';
import 'package:moli_app/constants/image_assets.dart';
import 'package:moli_app/features/authentication/authentication.dart';
import 'package:moli_app/shared/shared.dart';

extension NetworkExceptionDialog on BuildContext {
  Future<int> showNetworkExceptionDialog(NetworkException exception) async {
    final Widget title = exception.maybeWhen<Widget>(
      CancelException: (String name) => Text(name),
      FetchDataException: (String name) => Text(name),
      TokenExpiredException: (_) => Text(l10n.your_session_has_expired),
      OtherException: (String name) => Text(name),
      FormatException: (String name) => Text(name),
      UnrecognizedException: (String name) => Text(name),
      ApiException: (_, __) => Text(l10n.serrver_error),
      orElse: () => Text(l10n.error),
    );

    final Widget content = exception.maybeWhen<Widget>(
      CancelException: (_) => Text(l10n.request_cancelled_prematurely),
      FetchDataException: (_) => Text(l10n.no_internet_connectivity),
      TokenExpiredException: (_) => Text(l10n.token_session_expired),
      OtherException: (_) => Text(l10n.other_error),
      FormatException: (_) => Text(l10n.invalid_format_or_value_error),
      UnrecognizedException: (_) => Text(l10n.unknown_error),
      ApiException: (_, String message) =>
          Text(message, maxLines: 3, overflow: TextOverflow.ellipsis),
      orElse: () => Text(l10n.request_failed),
    );

    final Widget? image = exception.maybeWhen<Widget?>(
      CancelException: (_) => Image.asset(ImageAssets.requestFail),
      FetchDataException: (_) => Image.asset(ImageAssets.noInternet),
      TokenExpiredException: (_) => Image.asset(ImageAssets.login),
      orElse: () => Image.asset(ImageAssets.otherError),
    );

    final List<Widget> actions = exception.maybeWhen<List<Widget>>(
      TokenExpiredException: (_) => <Widget>[
        AppElevatedButton(
          onPressed: () => Navigator.of(this, rootNavigator: true).pop(1),
          child: Text(l10n.log_in),
        )
      ],
      orElse: () => <Widget>[
        AppElevatedButton(
          onPressed: () => Navigator.of(this, rootNavigator: true).pop(0),
          child: Text(l10n.ok),
        ),
      ],
    );

    final int? result = await showDefaultDialog<int>(
      title: title,
      content: content,
      image: image,
      actions: actions,
    );

    // Fix animation close dialog
    await Future<void>.delayed(const Duration(milliseconds: 500));

    /// The returned result will perform the action
    /// 0. no action
    /// 1. go login
    /// 2. ...
    if (result == 1) {
      getIt<AuthenticationBloc>().add(const AuthenticationEvent.loggedOut());
    }

    return result ?? 0;
  }
}
