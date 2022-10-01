import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moli_app/shared/shared.dart';

import 'components/appointment_item.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  static const String routeName = 'appointment';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appointment),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.search_normal),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.filter_add),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          itemBuilder: (BuildContext context, int index) =>
              AppointmentItem(index: index),
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 12.w),
          itemCount: 10,
        ),
      ),
    );
  }
}
