import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moli_app/router/router.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../domain/doctor.dart';
import '../../bloc/bloc.dart';

class HospitalDoctorsPage extends StatefulWidget {
  const HospitalDoctorsPage({
    super.key,
    required this.hospitalId,
  });
  final int hospitalId;

  @override
  State<HospitalDoctorsPage> createState() => _HospitalDoctorsPageState();
}

class _HospitalDoctorsPageState extends State<HospitalDoctorsPage> {
  late final DoctorBloc _bloc;
  late final ScrollController _controller;

  @override
  void initState() {
    _bloc = DoctorBloc();
    _controller = ScrollController();
    _controller.addListener(_loadMoreData);
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
        body: CustomScrollView(
          slivers: <Widget>[
            const AppBarSliver(canBack: true, titleText: 'Chọn bác sĩ'),
            SliverPadding(
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
                            return _DoctorItem(
                              doctor: doctor,
                              onBook: () => context.goRouter.go(
                                  '${Routes.hospitals}/${widget.hospitalId}/create-appointment-by-hospital',
                                  extra: doctor),
                            );
                          },
                          childCount: doctors.doctors.length,
                        ),
                      );
                    },
                    failed: (_) => const SizedBox().sliverBox,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DoctorItem extends StatelessWidget {
  const _DoctorItem({
    required this.doctor,
    required this.onBook,
  });

  final Doctor doctor;
  final VoidCallback onBook;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () => context.goRouter
          .go('${context.goRouter.location}/${doctor.id}', extra: doctor),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(12),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 9,
                  color: ColorPalettes.neutral50.withOpacity(.12)),
              BoxShadow(
                  offset: const Offset(0, 22),
                  blurRadius: 136,
                  color: ColorPalettes.neutral50.withOpacity(.0296)),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BaseCard(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(),
              // crossAxisAlignment: CrossAxisAlignment.start,
              leading: const RoundedRectImage(
                width: 90,
                height: 90,
              ),
              leadingGap: 12,
              content: <Widget>[
                AppText.b0(doctor.name ?? 'sdsd').bold,
                const SizedBox(height: 4),
                AppText.b0(doctor.specialists
                    .map((Specialist e) => e.specialistName)
                    .join('\n')),
              ],
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: AppElevatedButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                onPressed: onBook,
                expandedWith: false,
                height: 40,
                child: const Text('Đặt khám'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
