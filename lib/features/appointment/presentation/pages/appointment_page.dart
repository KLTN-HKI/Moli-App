import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moli_app/constants/image_assets.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_app/shared/shared.dart';

import '../bloc/appointment_list/appointment_list_cubit.dart';
import 'components/appointment_item.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  static const String routeName = 'appointment';

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  late AppointmentListCubit _cubit;
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _cubit = AppointmentListCubit();
    _controller = ScrollController();
    _cubit.getAppoinments();
  }

  @override
  void dispose() {
    super.dispose();
    _cubit.close();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppointmentListCubit>.value(
      value: _cubit,
      child: Scaffold(
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
          child: RefreshIndicator(
            onRefresh: () async => _loadMoreData(),
            child: ListView(
              controller: _controller,
              padding: const EdgeInsets.all(16),
              physics: const AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                BlocConsumer<AppointmentListCubit, AppointmentListState>(
                  listener:
                      (BuildContext context, AppointmentListState state) {},
                  builder: (BuildContext context, AppointmentListState state) {
                    return state.maybeWhen(
                      initial: () => const LoadingIndicator(),
                      success: _buildBody,
                      failed: (NetworkException ex) => CustomErrorWidget(
                        message: ex.toString(),
                        child: Image.asset(ImageAssets.otherError),
                      ),
                      orElse: () => const SizedBox(),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(AppointmentList list, bool isLoading) {
    return Column(
      children: <Widget>[
        if (list.appointments.isEmpty)
          CustomErrorWidget(
            message: 'Không có lịch khám nào',
            child: Image.asset(
              ImageAssets.notFound,
              width: 150,
              height: 150,
            ),
          )
        else
          ...list.appointments.map(
            (Appointment appointment) =>
                AppointmentItem(appointment: appointment),
          ),
        if (isLoading) const LoadingIndicator()
      ].applySeparator(separator: const SizedBox(height: 16)),
    );
  }

  void _loadMoreData() {
    if (_controller.position.extentAfter < 100) {
      final bool isloading = _cubit.state.maybeWhen(
          success: (_, bool isLoading) => !isLoading, orElse: () => false);
      if (isloading) {
        _cubit.loadMore();
      }
    }
  }
}
