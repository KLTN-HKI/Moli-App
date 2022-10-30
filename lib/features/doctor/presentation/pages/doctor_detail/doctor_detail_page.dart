import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../bloc/schedule/schedule_bloc.dart';
import '../../cubit/doctor/doctor_cubit.dart';

class DoctorDetailPage extends StatefulWidget {
  const DoctorDetailPage({
    super.key,
    required this.doctorId,
    this.extra,
    this.viewOnly = false,
  });

  final String doctorId;
  final Object? extra;
  final bool viewOnly;

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  int? _doctorId;
  late DoctorCubit _cubit;
  late final ScheduleBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ScheduleBloc();
    _cubit = DoctorCubit();
    _doctorId = int.tryParse(widget.doctorId);
    // if (_doctorId == null && widget.extra != null && widget.extra is Doctor) {
    //   _doctor = widget.extra! as Doctor;
    // }
    _cubit.getDoctorDetail(_doctorId!);
    // _bloc.add(ScheduleEvent.fetchSchedule(
    //     doctorId: _doctor.id,
    //     dayOfYear: DateFormat('yyyy-MM-dd').format(DateTime.now())));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<ScheduleBloc>.value(
          value: _bloc,
        ),
        BlocProvider<DoctorCubit>.value(
          value: _cubit,
        ),
      ],
      child: BlocConsumer<DoctorCubit, DoctorState>(
        listener: (BuildContext context, DoctorState state) {
          if (state.exception != null) {
            context.showNetworkExceptionDialog(state.exception!);
          }
        },
        builder: (BuildContext context, DoctorState state) {
          final Doctor doctor = state.doctor;
          return Scaffold(
            // appBar: HeaderAppBar(
            //   transparentAppBar: true,
            //   titleText: _doctor.name,
            //   centerTitle: false,
            // ),
            body: LoadingOpacity(
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
                  const _DoctorInformation(),
                ],
              ),
            ),
            bottomNavigationBar: widget.viewOnly
                ? null
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: AppElevatedButton(
                      onPressed: () => context.goRouter.pushNamed(
                        'create-appointment',
                        queryParams: <String, dynamic>{
                          'doctorId': '${doctor.id}'
                        },
                        extra: doctor,
                      ),
                      child: const Text('Đặt khám'),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class _DoctorInformation extends StatelessWidget {
  const _DoctorInformation();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      sliver: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (BuildContext context, DoctorState state) {
          final Doctor doctor = state.doctor;
          return Container(
            decoration: BoxDecoration(
              color: context.colorScheme.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppText.t0(
                  doctor.name ?? 'Bác sĩ...',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ).weight600,
                const SizedBox(height: 8),
                AppText.t0(
                  doctor.specialists.isNotEmpty
                      ? doctor.specialists
                          .map((Specialist e) => e.specialistName)
                          .join('\n')
                      : 'Chưa cập nhật',
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                AppText.t1(
                  doctor.degree?.degreeName ?? 'Chưa cập nhật',
                  textOverflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText.t0('About doctor').bold,
                    const SizedBox(height: 4),
                    AppText.t1(
                      doctor.detail ?? 'chưa cập nhật',
                      // color: ColorPalettes.white,
                    ),
                    const SizedBox(height: 4),
                    AppText.t1(
                      'Làm việc tại địa chỉ: ${doctor.address ?? 'chưa cập nhật'}',
                      // color: ColorPalettes.white,
                    ),
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
