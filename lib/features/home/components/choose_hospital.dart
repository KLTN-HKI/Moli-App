import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/hospital/presentation/components/hospital_item.dart';
import 'package:moli_app/features/hospital/presentation/cubit/hospital_cubit.dart';
import 'package:moli_app/shared/shared.dart';

import '../../hospital/domain/hospital.dart';

class ChooseHospitalBuilder extends StatelessWidget {
  const ChooseHospitalBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText.t0('Phòng khám gần đây')
            .weight500
            .paddingSymmetric(horizontal: 24.w),
        // SizedBox(height: 4.w),
        SizedBox(
          height: 210.w,
          child: const HostpitalListView(),
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
        state.whenOrNull(failed: context.showNetworkExceptionDialog);
      },
      builder: (BuildContext context, HospitalState state) {
        return state.when(
          initial: () => const LoadingIndicator(),
          success: _buildBody,
          failed: (_) => const SizedBox(),
        );
      },
    );
  }

  Widget _buildBody(HospitalList list, bool isloading) =>
      Builder(builder: (BuildContext context) {
        if (list.hospitals.isEmpty) {
          return const Center(child: Text('Khong co benh vien nao'));
        } else {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 24.w),
            // shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final Hospital hospital = list.hospitals[index];

              return HospitalItem(hospital: hospital);
            },
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: 16.w),
            itemCount: list.hospitals.length,
          );
        }
      });

  void _loadMoreData() {
    if (_controller.position.extentAfter < 100) {
      _cubit.state.whenOrNull(
        success: (HospitalList hospitals, bool isLoading) {
          if (!isLoading && hospitals.pagination.hasMore) {
            _cubit.fetchAllHospital(page: hospitals.pagination.currentPage + 1);
          }
        },
      );
    }
  }
}
