import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/hospital/presentation/cubit/hospital_cubit.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/shared/shared.dart';

import '../../domain/hospital.dart';
import '../components/hospital_item.dart';

class HospitalPage extends StatelessWidget {
  const HospitalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HospitalCubit>(
      create: (BuildContext context) => HospitalCubit(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: HeaderAppBar(
          transparentAppBar: true,
          routeBack: Routes.home,
          titleText: 'Hospitals',
        ),
        body: SafeArea(child: HospitalBody()),
      ),
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
          return Column(children: <Widget>[
            GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              shrinkWrap: true,
              controller: _controller,
              itemCount: list.hospitals.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.w,
                childAspectRatio: 130 / 140,
                mainAxisSpacing: 14.w,
                crossAxisSpacing: 14.w,
              ),
              itemBuilder: (BuildContext context, int index) {
                final Hospital hospital = list.hospitals[index];
                return HospitalItem(hospital: hospital);
              },
            ),
            if (isloading) const LoadingIndicator()
          ]);
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
