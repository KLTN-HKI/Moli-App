import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/constants/image_assets.dart';
import 'package:moli_app/features/doctor/domain/doctor.dart';
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
          onRefresh: fetchData,
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
                  titlePadding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  title: AppText.t0(
                    _hospital.hospitalName ?? 'Bệnh viện ...',
                    textAlign: TextAlign.center,
                    maxLines: 2,
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
            ],
          ),
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
                    '${DateTimeUtils.fromTimeToStringType2(_hospital.workTimeStart)} - ${DateTimeUtils.fromTimeToStringType2(_hospital.workTimeEnd)}')
              ],
            ),
          ],
        ),
      ).sliverBox,
    );
  }
}
