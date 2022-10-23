import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moli_app/features/hospital/presentation/cubit/hospital_cubit.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../domain/hospital.dart';
import '../components/hospital_item.dart';

class HospitalPage extends StatelessWidget {
  const HospitalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HospitalCubit>(
      create: (BuildContext context) => HospitalCubit(),
      child: const HospitalBody(),
    );
  }
}

class HospitalBody extends StatefulWidget {
  const HospitalBody({super.key});

  @override
  State<HospitalBody> createState() => _HospitalBodyState();
}

class _HospitalBodyState extends State<HospitalBody> {
  late final HospitalCubit _cubit;
  late final ScrollController _controller;

  @override
  void initState() {
    _cubit = context.read<HospitalCubit>();
    _controller = ScrollController();
    _controller.addListener(_loadMoreData);
    _cubit.fetchAllHospital();
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
        title: AppText.t1('Tìm bệnh viện').weight500,
        hintText: 'Tìm bệnh viện',
        onSearch: (String value) {
          if (!StringUtils.isNullOrBlank(value)) {
            _cubit.fetchAllHospital(value);
          } else {
            _cubit.fetchAllHospital();
          }
        },
      ),
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: _cubit.fetchAllHospital,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: BlocConsumer<HospitalCubit, HospitalState>(
                bloc: _cubit,
                listener: (BuildContext context, HospitalState state) {
                  if (state.exception != null) {
                    context.showNetworkExceptionDialog(state.exception!);
                  }
                },
                builder: (BuildContext context, HospitalState state) {
                  switch (state.status) {
                    case StateStatus.loading:
                      return const LoadingIndicator();
                    case StateStatus.success:
                      return _buildBody(context, state);
                    case StateStatus.initial:
                    case StateStatus.updated:
                    case StateStatus.failure:
                      return const SizedBox();
                  }
                },
              ),
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildBody(BuildContext context, HospitalState state) => Builder(
        builder: (BuildContext context) {
          final List<Hospital> hospitals = state.hospitals.hospitals;
          if (hospitals.isEmpty) {
            return CustomErrorWidget(
              message: 'Không có bệnh viện nào',
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
              itemCount: hospitals.length + (state.isLoading ? 1 : 0),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 12),
              itemBuilder: (BuildContext context, int index) {
                if (index >= hospitals.length &&
                    state.hospitals.pagination.hasMore) {
                  return const LoadingIndicator();
                }
                final Hospital hospital = hospitals[index];
                return HospitalListItem(hospital: hospital);
              },
            );
          }
        },
      );

  void _loadMoreData() {
    if (_controller.position.extentAfter < 100) {
      _cubit.loadMore();
    }
  }
}
