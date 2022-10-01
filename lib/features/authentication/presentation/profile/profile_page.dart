import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/constants/icon_assets.dart';
import 'package:moli_app/features/authentication/domain/response/response.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/shared/shared.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: HeaderAppBar(
          transparentAppBar: true,
          title: Text(context.l10n.my_profile),
        ),
        body: const SafeArea(child: ProfileBody()),
        bottomNavigationBar: AppElevatedButton(
          onPressed: null,
          child: Text(context.l10n.confirm),
        ).paddingAll(16),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        return state.maybeWhen(
            authenticated: _buildBody, orElse: () => AppText.b0('Login First'));
      },
    );
  }

  Widget _buildBody(UserModel user) => Builder(builder: (BuildContext context) {
        return ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            _buildAvatar(user.name),
            _buildTextField(icon: IconAssets.icProfile, value: user.name),
            _buildTextField(icon: IconAssets.icCake, value: user.dateOfBirth),
            _buildTextField(
                icon: IconAssets.icGender, value: user.gender.toString()),
            _buildTextField(
                icon: IconAssets.icCallCalling, value: user.realPhoneNumber),
            _buildTextField(icon: IconAssets.icSms, value: user.email),
          ].applySeparator(separator: const SizedBox(height: 16)),
        );
      });

  Widget _buildTextField({required String icon, String? value}) =>
      Builder(builder: (BuildContext context) {
        return TextFormField(
          initialValue: value,
          enabled: false,
          decoration: InputDecoration(prefixIcon: AppIcon(icon).paddingAll(16)),
        );
      });

  Widget _buildAvatar(String? url) => Builder(builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            RoundedImage(size: 120, imageURL: url),
            const SizedBox(height: 4),
            // AppText.t1(
            //   'Đổi ảnh đại diện',
            //   color: context.colorScheme.primary,
            // ).weight500,
          ],
        );
      });
}
