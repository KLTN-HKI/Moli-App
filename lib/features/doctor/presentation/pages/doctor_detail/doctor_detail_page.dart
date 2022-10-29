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
            // body: SingleChildScrollView(
            //   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       BaseCard(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         leading: const RoundedRectImage(
            //           height: 100,
            //           width: 100,
            //         ),
            //         content: <Widget>[
            //           AppText.b0(_doctor.name ?? '').weight600,
            //           const Divider(),
            //           AppText.b2(_doctor.degree?.degreeName ?? ''),
            //           const SizedBox(height: 4),
            //           AppText.b2(_doctor.address ?? 'Địa chỉ...'),
            //         ],
            //       ),
            //       const SizedBox(height: 16),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           AppText.t0('Về bác sĩ').bold,
            //           AppText.b0(_doctor.detail ?? ' (Chưa có thông tin)')
            //         ],
            //       ),
            //       const SizedBox(height: 16),
            //       // Column(
            //       //   crossAxisAlignment: CrossAxisAlignment.start,
            //       //   children: <Widget>[
            //       //     AppText.t0('Thời gian làm việc').bold,
            //       //     // AppText.b0('//${}')
            //       //   ],
            //       // ),
            //       // const SizedBox(height: 16),
            //       // Column(
            //       //   crossAxisAlignment: CrossAxisAlignment.start,
            //       //   children: <Widget>[
            //       //     AppText.t0('Lịch rảnh').bold,
            //       //     const SizedBox(height: 16),
            //       //     BlocBuilder<ScheduleBloc, ScheduleState>(
            //       //       builder: (BuildContext context, ScheduleState state) {
            //       //         return state.when(
            //       //             initial: () => const LoadingIndicator(),
            //       //             success:
            //       //                 (DoctorAvailableTime schedule, bool isLoading) {
            //       //               return GridView.builder(
            //       //                 gridDelegate:
            //       //                     const SliverGridDelegateWithMaxCrossAxisExtent(
            //       //                   maxCrossAxisExtent: 80,
            //       //                   mainAxisSpacing: 10,
            //       //                   crossAxisSpacing: 10,
            //       //                 ),
            //       //                 shrinkWrap: true,
            //       //                 itemCount: schedule.doctorSchedules.length,
            //       //                 itemBuilder: (BuildContext context, int index) {
            //       //                   final DoctorSchedule slot =
            //       //                       schedule.doctorSchedules[index];
            //       //                   return ToggleableTag<DoctorSchedule>(
            //       //                     onTap: () {},
            //       //                     text:
            //       //                         '${DateTimeUtils.fromTimeToStringType2(slot.workTimeStart)}',
            //       //                   );
            //       //                 },
            //       //               );
            //       //             },
            //       //             failed: (NetworkException e) => CustomErrorWidget(
            //       //                   message: e.toString(),
            //       //                   child: Image.asset(ImageAssets.errorResponse),
            //       //                 ));
            //       //       },
            //       //     )
            //       //   ],
            //       // ),
            //     ],
            //   ),
            // ),
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
                      '${context.l10n.address}: ${doctor.address ?? 'Chưa cập nhật'}',
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
