import 'package:flutter/material.dart';

import 'components/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                const SizedBox(height: 48),
                const Profilebody(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
