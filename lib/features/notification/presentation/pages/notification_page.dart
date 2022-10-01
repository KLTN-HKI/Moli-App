import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moli_app/shared/shared.dart';

import '../cubit/notification_list_cubit.dart';
import 'components/notification_body.dart';
import 'components/notification_laster.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  static const String routeName = 'notification';

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late final NotificationListCubit _cubit;
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _cubit = NotificationListCubit();
    // _cubit.fetchData();

    _controller = ScrollController();
    _controller.addListener(_loadMoreData);
  }

  @override
  void dispose() {
    super.dispose();
    _cubit.close();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationListCubit>.value(
      value: _cubit,
      child: Scaffold(
        appBar: HeaderAppBar(titleText: context.l10n.notification),
        body: SafeArea(
            child: RefreshIndicator(
          onRefresh: () => _cubit.fetchData(),
          child: ListView(
            controller: _controller,
            children: const <Widget>[
              NotificationLaster(),
              NotificationBody(),
            ],
          ),
        )),
      ),
    );
  }

  void _loadMoreData() {
    if (_controller.position.extentAfter < 100) {
      _cubit.loadMoreData();
    }
  }
}
