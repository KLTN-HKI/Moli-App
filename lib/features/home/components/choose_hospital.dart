import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/hospital/presentation/components/hospital_item.dart';
import 'package:moli_app/features/hospital/presentation/cubit/hospital_cubit.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../hospital/domain/hospital.dart';

class ChooseHospitalBuilder extends StatelessWidget {
  const ChooseHospitalBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText.t0(' Bệnh viện').weight500.paddingSymmetric(horizontal: 24),
        // SizedBox(height: 4),
        const SizedBox(
          height: 215,
          child: HostpitalListView(),
        ),
      ],
    );
  }
}

class HostpitalListView extends StatefulWidget {
  const HostpitalListView({super.key});

  @override
  State<HostpitalListView> createState() => _HostpitalListViewState();
}

class _HostpitalListViewState extends State<HostpitalListView> {
  late final HospitalCubit _cubit;
  late final ScrollController _controller;

  @override
  void initState() {
    _cubit = HospitalCubit();
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
     return BlocConsumer<HospitalCubit, HospitalState>(
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
            return _buildBody(state.hospitals, state.isLoading);
          case StateStatus.initial:
          case StateStatus.updated:
          case StateStatus.failure:
            return const SizedBox();
        }
      },
    );
  }

  Widget _buildBody(HospitalList list, bool isloading) =>
      Builder(builder: (BuildContext context) {
        if (list.hospitals.isEmpty) {
          return const Center(child: Text('Khong co benh vien nao'));
        } else {
          return ListView.separated(
            scrollDirection: Axis.horizontal, controller: _controller,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            // shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final Hospital hospital = list.hospitals[index];

              return HospitalItem(hospital: hospital);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 16),
            itemCount: list.hospitals.length,
          );
        }
      });

  void _loadMoreData() {
    if (_controller.position.extentAfter < 100) {
      _cubit.loadMore();
    }
  }
}
