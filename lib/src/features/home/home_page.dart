import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/l10n/l10n.dart';
import 'package:moli_app/src/features/app/bloc/bloc.dart';
import 'package:moli_app/src/shared/shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = false;
  String languageCode = 'vi';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.hello),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                languageCode == 'vi'
                    ? languageCode = 'en'
                    : languageCode = 'vi';
              });
              context.read<AppSettingsCubit>().changeLanguage(languageCode);
            },
            child: Text(
              context.l10n.langauge,
              style: const TextStyle(color: Colors.white).weight500,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isDark = !isDark;
          });
          context
              .read<AppSettingsCubit>()
              .changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
        },
        child: const Text('theme'),
      ),
    );
  }
}
