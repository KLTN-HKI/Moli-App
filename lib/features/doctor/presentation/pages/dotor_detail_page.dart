import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_app/features/doctor/domain/schedule.dart';
import 'package:moli_app/shared/shared.dart';
import 'package:moli_app/shared/widgets/tag/toggleable_tag.dart';

import '../bloc/bloc.dart';

class DoctorDetailPage extends StatefulWidget {
  const DoctorDetailPage({super.key, required this.doctorId, this.extra});

  final int doctorId;
  final Object? extra;

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  late Doctor _doctor;
  late final ScheduleBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ScheduleBloc();
    if (widget.extra != null && widget.extra is Doctor) {
      _doctor = widget.extra! as Doctor;
    }
    _bloc.add(ScheduleEvent.fetchSchedule(doctorId: _doctor.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScheduleBloc>.value(
      value: _bloc,
      child: Scaffold(
        extendBody: true,
        appBar: HeaderAppBar(
          transparentAppBar: true,
          titleText: _doctor.name,
          centerTitle: false,
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Iconsax.heart)),
            IconButton(onPressed: () {}, icon: const Icon(Iconsax.more)),
          ],
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BaseCard(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  leading: const RoundedRectImage(
                    height: 100,
                    width: 100,
                  ),
                  content: <Widget>[
                    AppText.b0(_doctor.name ?? '').weight600,
                    const Divider(),
                    AppText.b2(_doctor.degree?.degreeName ?? ''),
                    const SizedBox(height: 4),
                    AppText.b2(_doctor.address ?? 'Địa chỉ...'),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText.t0('About me ').bold,
                    AppText.b0(_doctor.toString())
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText.t0('Working time ').bold,
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText.t0('Schedule:').bold,
                    const SizedBox(height: 16),
                    BlocBuilder<ScheduleBloc, ScheduleState>(
                      builder: (BuildContext context, ScheduleState state) {
                        return state.when(
                            initial: () => const LoadingIndicator(),
                            success:
                                (DoctorAvailableTime schedule, bool isLoading) {
                              return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 80,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                                shrinkWrap: true,
                                itemCount: schedule.doctorSchedules.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final DoctorSchedule slot =
                                      schedule.doctorSchedules[index];
                                  return ToggleableTag<DoctorSchedule>(
                                    onTap: () {},
                                    text:
                                        '${DateTimeUtils.fromTimeToStringType2(slot.workTimeStart)}',
                                  );
                                },
                              );
                            },
                            failed: (NetworkException e) => Text(e.toString()));
                      },
                    )
                  ],
                ),
              ],
            )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: AppElevatedButton(
            onPressed: () {},
            child: const Text('Book doctor'),
          ),
        ),
      ),
    );
  }
}
