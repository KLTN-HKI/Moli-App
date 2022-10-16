import 'package:flutter/material.dart';

import 'package:moli_shared/moli_shared.dart';

class NotificationDetailPage extends StatelessWidget {
  const NotificationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBar(
        title: Text(context.l10n.notification + context.l10n.detail),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: context.colorScheme.background,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        blurRadius: 17,
                        color: ColorPalettes.black.withOpacity(.15)),
                    BoxShadow(
                        blurRadius: 5,
                        color: ColorPalettes.black.withOpacity(.04)),
                    BoxShadow(
                        blurRadius: 2,
                        color: ColorPalettes.black.withOpacity(.04)),
                    BoxShadow(
                        blurRadius: .8,
                        color: ColorPalettes.black.withOpacity(.05)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText.b0('Bạn có 1 thông báo'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
