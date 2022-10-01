import 'package:flutter/material.dart';

import 'components/menu_body.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  static const String routeName = 'menu';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: MenuBody(),
      ),
    );
  }
}
