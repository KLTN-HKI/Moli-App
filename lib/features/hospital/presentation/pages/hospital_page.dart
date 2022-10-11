import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/constants/image_assets.dart';
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
          titleText: 'Tìm bệnh viện',
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
        final List<Hospital> temp = list.hospitals;
        if (temp.isEmpty) {
          return CustomErrorWidget(
            message: 'Không có bệnh viện nào',
            child: Image.asset(ImageAssets.notFound),
          );
        } else {
          return RefreshIndicator(
            onRefresh: _cubit.fetchAllHospital,
            child: ListView(
                controller: _controller,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                physics: const AlwaysScrollableScrollPhysics(),
                children: <Widget>[
                  ...temp.map((Hospital hospital) =>
                      HospitalListItem(hospital: hospital)),
                  if (isloading) const LoadingIndicator()
                ].applySeparator(separator: const SizedBox(height: 12))),
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
