import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/doctor/presentation/pages/doctors/components/doctor_item.dart';

import 'package:moli_shared/moli_shared.dart';

import '../../../domain/doctor.dart';
import '../../cubit/doctor_list/doctor_list_cubit.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DoctorListCubit>(
      create: (BuildContext context) => DoctorListCubit(),
      child: const DoctorBody(),
    );
  }
}

class DoctorBody extends StatefulWidget {
  const DoctorBody({super.key});

  @override
  State<DoctorBody> createState() => _DoctorBodyState();
}

class _DoctorBodyState extends State<DoctorBody> {
  late DoctorListCubit _cubit;
  late final ScrollController _controller;

  @override
  void initState() {
    _cubit = context.read<DoctorListCubit>();
    _controller = ScrollController()..addListener(_loadMoreData);
    _cubit.getAllDoctor();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SearchAppBar(
        title: AppText.t1('Tìm bác sĩ').weight500,
        hintText: 'Tìm bác sĩ',
        onSearch: (String value) {
          if (!StringUtils.isNullOrBlank(value)) {
            _cubit.getAllDoctor(value);
          } else {
            _cubit.getAllDoctor();
          }
        },
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _cubit.getAllDoctor,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _controller,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: BlocConsumer<DoctorListCubit, DoctorListState>(
                    bloc: _cubit,
                    listener: (BuildContext context, DoctorListState state) {
                      if (state.exception != null) {
                        context.showNetworkExceptionDialog(state.exception!);
                      }
                    },
                    builder: (BuildContext context, DoctorListState state) {
                      switch (state.status) {
                        case StateStatus.loading:
                          return const LoadingIndicator();
                        case StateStatus.success:
                          final List<Doctor> doctorData = state.doctors.doctors;
                          if (doctorData.isEmpty) {
                            return CustomErrorWidget(
                              message: 'Không có bác sĩ nào',
                              child: Image.asset(
                                ImageAssets.notFound,
                                height: 250,
                                width: 250,
                              ),
                            );
                          } else {
                            return ListView.separated(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  doctorData.length + (state.isLoading ? 1 : 0),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(height: 12),
                              itemBuilder: (BuildContext context, int index) {
                                if (index >= doctorData.length &&
                                    state.doctors.pagination.hasMore) {
                                  return const LoadingIndicator();
                                }
                                final Doctor doctor = doctorData[index];
                                return DoctorItem(doctor: doctor);
                              },
                            );
                          }
                        case StateStatus.initial:
                        case StateStatus.updated:
                        case StateStatus.failure:
                          return const SizedBox();
                      }
                    }),
              ),
            ),
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
