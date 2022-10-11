import 'package:flutter/material.dart';
import 'components/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomeBody(),
      ),
    );
  }
}
