import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../doctor/presentation/bloc/doctor/doctor_bloc.dart';
import '../../../domain/hospital.dart';
import '../../cubit/hospital/cubit/hospital_cubit.dart';

class HospitalDetailPage extends StatefulWidget {
  const HospitalDetailPage({super.key, required this.hospitalId, this.extra});

  final int hospitalId;
  final Object? extra;

  @override
  State<HospitalDetailPage> createState() => _HospitalDetailPageState();
}

class _HospitalDetailPageState extends State<HospitalDetailPage> {
  late final DoctorBloc _bloc;
  late final HospitalCubit _cubit;
  late final ScrollController _controller;
  // late final Hospital _hospital;

  @override
  void initState() {
    _bloc = DoctorBloc();
    _cubit = HospitalCubit();
    _controller = ScrollController();
    _controller.addListener(_loadMoreData);
    /* if (widget.extra != null && widget.extra is Hospital) {
      _hospital = widget.extra! as Hospital;
    } */
    _cubit.getHospitalDetail(widget.hospitalId);
    super.initState();
  }

  Future<void> fetchData() async {
    _bloc.add(
        DoctorEvent.fetchDoctorsByHospitalId(hospitalId: widget.hospitalId));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _bloc.close();
  }

  void _loadMoreData() {
    if (_controller.position.extentAfter < 100) {
      _bloc.state.whenOrNull(
        success: (DoctorList doctors, bool isLoading) {
          if (!isLoading && doctors.pagination.hasMore) {
            _bloc.add(DoctorEvent.fetchDoctorsByHospitalId(
                hospitalId: widget.hospitalId,
                page: doctors.pagination.currentPage + 1));
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<DoctorBloc>.value(
          value: _bloc,
        ),
        BlocProvider<HospitalCubit>.value(
          value: _cubit,
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<HospitalCubit, HospitalState>(
          listener: (BuildContext context, HospitalState state) {
            if (state.exception != null) {
              context.showNetworkExceptionDialog(state.exception!);
            }
          },
          builder: (BuildContext context, HospitalState state) {
            return LoadingOpacity(
              loading: state.status.isLoading,
              isOpacity: false,
              child: CustomScrollView(
                slivers: <Widget>[
                  AppBarSliver(
                    expandedHeight: 200,
                    canBack: true,
                    flexibleSpace: FlexibleSpaceBar(
                      expandedTitleScale: 1,
                      background: CachedNetworkImage(
                        imageUrl: '',
                        errorWidget: (_, __, ___) => Image.asset(
                          ImageAssets.appIcon,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // centerTitle: true,
                      // titlePadding:
                      //     const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      // title: AppText.t0(
                      //   _hospital.hospitalName ?? 'Bệnh viện ...',
                      //   textAlign: TextAlign.center,
                      //   maxLines: 2,
                      // ).weight600,
                    ),
                  ),
                  const _HospitalInfo(),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: AppElevatedButton(
            onPressed: () => context.goRouter.go(
                '${context.goRouter.location}/hospital-doctors',
                extra: widget.hospitalId),
            child: const Text('Đặt khám'),
          ),
        ),
      ),
    );
  }
}

class _HospitalInfo extends StatelessWidget {
  const _HospitalInfo();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      sliver: BlocBuilder<HospitalCubit, HospitalState>(
        builder: (BuildContext context, HospitalState state) {
          final Hospital hospital = state.hospital;
          return Container(
            decoration: BoxDecoration(
              color: context.colorScheme.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText.t0(
                  hospital.hospitalName ?? 'Bệnh viện ...',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ).weight600,
                AppText.t1(
                  '${context.l10n.address}: ${hospital.hospitalAddress?.addressDetail}',
                  // color: ColorPalettes.white,
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText.t0('About hospital ').bold,
                    const SizedBox(height: 4),
                    AppText.b0('')
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText.t0('Work time:').bold,
                    const SizedBox(height: 4),
                    AppText.b0(
                        '${DateTimeUtils.fromTimeToStringType2(hospital.workTimeStart)} - ${DateTimeUtils.fromTimeToStringType2(hospital.workTimeEnd)}')
                  ],
                ),
              ],
            ),
          );
        },
      ).sliverBox,
    );
  }
}
