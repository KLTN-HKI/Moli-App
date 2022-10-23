import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moli_app/features/appointment/domain/appointment.dart';
import 'package:moli_shared/moli_shared.dart';

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
    _cubit = context.read<AppointmentListCubit>();
    _controller = ScrollController()..addListener(_loadMoreData);
    _cubit.getAppoinments();
  }

  @override
  void dispose() {
    super.dispose();
    // _cubit.close();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBar(
        titleText: context.l10n.appointment_doctor,
        transparentAppBar: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _cubit.getAppoinments,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                controller: _controller,
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child:
                      BlocConsumer<AppointmentListCubit, AppointmentListState>(
                    listener:
                        (BuildContext context, AppointmentListState state) {
                      if (state.exception != null) {
                        context.showNetworkExceptionDialog(state.exception!);
                      }
                    },
                    builder:
                        (BuildContext context, AppointmentListState state) {
                      switch (state.status) {
                        case StateStatus.loading:
                          return const LoadingIndicator();
                        case StateStatus.success:
                          final AppointmentList list = state.appointmentList;
                          if (list.appointments.isEmpty) {
                            return CustomErrorWidget(
                              message: 'Không có lịch khám nào',
                              child: Image.asset(
                                ImageAssets.notFound,
                                width: 150,
                                height: 150,
                              ),
                            );
                          } else {
                            return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              shrinkWrap: true,
                              itemCount: list.appointments.length +
                                  (state.isLoading ? 1 : 0),
                              itemBuilder: (BuildContext context, int index) {
                                if (index >= list.appointments.length &&
                                    list.pagination.hasMore) {
                                  return const LoadingIndicator();
                                }
                                final Appointment appointment =
                                    list.appointments[index];
                                return AppointmentItem(
                                    appointment: appointment);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                height: 16,
                              ),
                            );
                          }
                        case StateStatus.initial:
                        case StateStatus.updated:
                        case StateStatus.failure:
                          return const SizedBox();
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _loadMoreData() {
    if (_controller.position.extentAfter < 100) {
      _cubit.loadMore();
    }
  }
}
