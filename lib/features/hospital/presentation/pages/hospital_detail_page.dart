import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/constants/image_assets.dart';
import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../doctor/presentation/bloc/doctor/doctor_bloc.dart';
import '../../domain/hospital.dart';

class HospitalDetailPage extends StatefulWidget {
  const HospitalDetailPage({super.key, required this.hospitalId, this.extra});

  final int hospitalId;
  final Object? extra;

  @override
  State<HospitalDetailPage> createState() => _HospitalDetailPageState();
}

class _HospitalDetailPageState extends State<HospitalDetailPage> {
  late final DoctorBloc _bloc;
  late final ScrollController _controller;
  late final Hospital _hospital;

  @override
  void initState() {
    _bloc = DoctorBloc();
    _controller = ScrollController();
    _controller.addListener(_loadMoreData);
    if (widget.extra != null && widget.extra is Hospital) {
      _hospital = widget.extra! as Hospital;
    }
    fetchData();
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
    return BlocProvider<DoctorBloc>.value(
      value: _bloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: RefreshIndicator(
          onRefresh: () => fetchData(),
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
                  centerTitle: true,
                  // titlePadding: ,
                  title: AppText.t0(
                    _hospital.hospitalName ?? 'Bệnh viện gì đó..',
                    // color: ColorPalettes.white,
                  ).weight600,
                ),
                actions: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.archive_1,
                      color: ColorPalettes.black,
                    ),
                  ),
                ],
              ),
              _HospitalInfo(hospital: _hospital),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: AppText.t0('Bác sĩ').weight500.sliverBox,
              ),
              BlocProvider<DoctorBloc>.value(
                value: _bloc,
                child: const HospitalDoctors(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HospitalDoctors extends StatelessWidget {
  const HospitalDoctors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      sliver: BlocConsumer<DoctorBloc, DoctorState>(
        listener: (BuildContext context, DoctorState state) {
          state.whenOrNull(failed: context.showNetworkExceptionDialog);
        },
        builder: (BuildContext context, DoctorState state) {
          return state.when(
            initial: () => const LoadingIndicator().sliverBox,
            success: (DoctorList doctors, bool isLoading) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final Doctor doctor = doctors.doctors[index];
                    return _DoctorItem(doctor: doctor);
                  },
                  childCount: doctors.doctors.length,
                ),
              );
            },
            failed: (_) => const SizedBox().sliverBox,
          );
        },
      ),
    );
  }
}

class _DoctorItem extends StatelessWidget {
  const _DoctorItem({
    required this.doctor,
  });

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: () => context.goRouter.go(
          '${context.goRouter.location}/${Routes.doctorDetail}/${doctor.id}',
          extra: doctor),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      crossAxisAlignment: CrossAxisAlignment.start,
      leading: const RoundedRectImage(
        width: 60,
        height: 60,
      ),
      leadingGap: 12,
      content: <Widget>[
        AppText.b0(doctor.name ?? 'sdsd').bold,
        const SizedBox(height: 4),
        AppText.b0(doctor.specialists
            .map((Specialist e) => e.specialistName)
            .join('\n')),
        const SizedBox(height: 4),
      ],
    );
  }
}

class _HospitalInfo extends StatelessWidget {
  const _HospitalInfo({
    required Hospital hospital,
  }) : _hospital = hospital;

  final Hospital _hospital;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
      sliver: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppText.t1(
              '${context.l10n.address}: ${_hospital.hospitalAddress?.addressDetail}',
              // color: ColorPalettes.white,
            ),
          ],
        ),
      ).sliverBox,
    );
  }
}
