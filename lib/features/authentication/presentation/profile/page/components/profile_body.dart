import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/shared/shared.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'profile_item.dart';

class Profilebody extends StatelessWidget {
  const Profilebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const BaseProfileCard(),
      SizedBox(height: 32.w),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            ProfileItem(
              icon: IconAssets.icProfileBold,
              label: context.l10n.personal_infomation,
            ),
            SizedBox(height: 12.w),
            ProfileItem(
              icon: IconAssets.icLock,
              label: context.l10n.change_password,
            ),
            SizedBox(height: 12.w),
            ProfileItem(
              icon: IconAssets.icLogout,
              label: context.l10n.log_out,
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(const AuthenticationEvent.loggedOut());
              },
              withArrow: false,
            ),
            /* ProfileItem(
              icon: IconAssets.icAccountCirle,
              label: context.l10n.log_out,
              onPressed: () {},
              withArrow: false,
            ), */
            SizedBox(height: 56.w),
            AppElevatedButtonIcon(
              label: const Text('Hotline - 1900 xxxx'),
              icon: IconAssets.icSupport,
              onPressed: () {},
            ),
            SizedBox(height: 12.w),
            Align(
              // ignore: always_specify_types
              child: FutureBuilder(
                future: PackageInfo.fromPlatform(),
                builder: (BuildContext context,
                        AsyncSnapshot<PackageInfo> snapshot) =>
                    Text(
                  '${context.l10n.app_version} ${snapshot.data?.version ?? ''}',
                  style: context.textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class BaseProfileCard extends StatelessWidget {
  const BaseProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      mainAxisAlignment: MainAxisAlignment.center,
      backgroundColor: ColorPalettes.transparent,
      padding: const EdgeInsets.fromLTRB(24, 0, 12, 0),
      leading: SizedBox(
        height: 56,
        width: 56,
        child: CachedNetworkImage(
          imageUrl: ImageAssets.avatar,
          imageBuilder:
              (BuildContext context, ImageProvider<Object> imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          errorWidget: (BuildContext context, String url, _) =>
              const ErrorImage(isRounded: true),
        ),
      ),
      leadingGap: 24.w,
      header: [
        AppText.t0('Châu Quốc An').weight600,
        AppText.b1('0789295411'),
      ],
    );
  }
}
