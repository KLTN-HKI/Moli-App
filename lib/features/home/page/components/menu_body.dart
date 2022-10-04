import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/features/authentication/domain/response/response.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/shared/shared.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'menu_item.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // physics: const ClampingScrollPhysics(),
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Column(children: <Widget>[
                const BaseProfileCard(),
                SizedBox(height: 32.w),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: <Widget>[
                      AppMenuItem(
                        onPressed: () =>
                            context.goRouter.go('/menu/${Routes.profile}'),
                        icon: IconAssets.icProfileBold,
                        label: context.l10n.personal_infomation,
                      ),
                      SizedBox(height: 12.w),
                      AppMenuItem(
                        onPressed: () {},
                        icon: IconAssets.icShieldTick,
                        label: context.l10n.password_security,
                      ),
                      SizedBox(height: 12.w),
                      AppMenuItem(
                        onPressed: () {},
                        icon: IconAssets.icInfo,
                        label: context.l10n.policy,
                      ),
                      SizedBox(height: 12.w),
                      AppMenuItem(
                        onPressed: () {},
                        icon: IconAssets.icBook,
                        label: context.l10n.terms_conditions,
                      ),
                      SizedBox(height: 12.w),
                      AppMenuItem(
                        icon: IconAssets.icLogout,
                        label: context.l10n.log_out,
                        onPressed: () => onLogoutPressed(context),
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
                        child: FutureBuilder<PackageInfo>(
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
              ])
            ],
          ),
        ),
      ],
    );
  }

  void onLogoutPressed(BuildContext context) {
    SmoothDialog(
      context: context,
      dialogType: DialogType.confirmation,
      path: JsonAssets.logout,
      mode: SmoothMode.lottie,
      content: context.l10n.log_out_confirmation,
      title: context.l10n.log_out,
      // dialogHeight: 350,
      submit: () => context
          .read<AuthenticationBloc>()
          .add(const AuthenticationEvent.loggedOut()),
    );
  }
}

class BaseProfileCard extends StatelessWidget {
  const BaseProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        return state.maybeWhen(
            authenticated: _buildBody, orElse: () => AppText.b0('Login First'));
      },
    );
  }

  Widget _buildBody(UserModel user) => BaseCard(
        mainAxisAlignment: MainAxisAlignment.center,
        // backgroundColor: ColorPalettes.transparent,
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: SizedBox(
          height: 56,
          width: 56,
          child: CachedNetworkImage(
            imageUrl: '',
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
        leadingGap: 16,
        content: <Widget>[
          AppText.t0(
            user.name ?? user.email ?? 'unknown',
            textOverflow: TextOverflow.ellipsis,
          ).weight600,
          AppText.b1(user.phoneNumber ?? 'unknown'),
        ],
      );
}
