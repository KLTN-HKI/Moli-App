import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/features/authentication/authentication.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../../shared/widgets/tag/toggleable_tag.dart';
import '../../../authentication/domain/response/response.dart';
import '../../../doctor/domain/doctor.dart';
import '../../../doctor/domain/schedule.dart';
import '../../../doctor/presentation/bloc/bloc.dart';
import 'components/date_picker.dart';

class CreateAppointmentByHospitalPage extends StatefulWidget {
  const CreateAppointmentByHospitalPage({
    super.key,
    required this.hospitalId,
    this.extra,
  });

  final int hospitalId;
  final Object? extra;

  @override
  State<CreateAppointmentByHospitalPage> createState() =>
      _CreateAppointmentByHospitalPageState();
}

class _CreateAppointmentByHospitalPageState
    extends State<CreateAppointmentByHospitalPage> {
  late Doctor _doctor;
  late final ScheduleBloc _bloc;
  late DateTime selectedDate;
  int? selectedShedule;
  bool forSelf = true;
  UserModel? patient;
  @override
  void initState() {
    super.initState();
    _bloc = ScheduleBloc();
    selectedDate = DateTime.now();
    if (widget.extra != null && widget.extra is Doctor) {
      _doctor = widget.extra! as Doctor;
    }
    final authBloc = context.read<AuthenticationBloc>();
    patient = authBloc.state.whenOrNull(authenticated: (user) => user);
    _fetchSchduleByDate(selectedDate);
  }

  void _fetchSchduleByDate(DateTime selectedDate) {
    _bloc.add(ScheduleEvent.fetchSchedule(
        doctorId: _doctor.id,
        dayOfYear: DateFormat('yyyy-MM-dd').format(selectedDate)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScheduleBloc>.value(
      value: _bloc,
      child: Scaffold(
        appBar: const HeaderAppBar(
          titleText: 'Đặt khám',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseCard(
                padding: const EdgeInsets.all(16),
                leading: const RoundedRectImage(
                  width: 90,
                  height: 90,
                ),
                leadingGap: 12,
                content: <Widget>[
                  AppText.b0(_doctor.name ?? 'sdsd').bold,
                  const SizedBox(height: 4),
                  AppText.b0(_doctor.specialists
                      .map((Specialist e) => e.specialistName)
                      .join('\n')),
                ],
              ),
              const SizedBox(height: 24),
              AppText.t0('Đặt khám cho:').bold,
              Row(
                children: [
                  AppRadio<bool>(
                    groupValue: forSelf,
                    onChanged: (bool? value) {
                      setState(() {
                        forSelf = value!;
                      });
                    },
                    value: true,
                  ),
                  AppText.b1('Cho tôi'),
                  const SizedBox(width: 16),
                  AppRadio<bool>(
                    groupValue: forSelf,
                    onChanged: (bool? value) {
                      setState(() {
                        forSelf = value!;
                      });
                    },
                    value: false,
                  ),
                  AppText.b1('Cho người khác'),
                ],
              ),
              if (forSelf) ...[
                const SizedBox(height: 4),
                AppText.b1('Tên bệnh nhân: ${patient?.name ?? ''}'),
                const SizedBox(height: 4),
                AppText.b1('Giới tính: ${patient?.gender ?? ''}'),
                const SizedBox(height: 4),
                AppText.b1('Email: ${patient?.email ?? ''}'),
                const SizedBox(height: 4),
                AppText.b1('Số điện thoại: ${patient?.realPhoneNumber ?? ''}'),
                const SizedBox(height: 4),
              ],
              const SizedBox(height: 4),
              AppText.t0('Ngày khám:').bold,
              const SizedBox(height: 4),
              AppointmentDateTimePicker(
                label: 'Ngày khám',
                initialDate: selectedDate,
                onChange: (DateTime? value) {
                  selectedDate = value ?? DateTime.now();
                  _fetchSchduleByDate(selectedDate);
                },
              ),
              const SizedBox(height: 12),
              BlocBuilder<ScheduleBloc, ScheduleState>(
                builder: (BuildContext context, ScheduleState state) {
                  return state.when(
                    initial: () => const LoadingIndicator(),
                    success: (DoctorAvailableTime schedule, bool isLoading) {
                      if (schedule.doctorSchedules.isNotEmpty) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 120,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          shrinkWrap: true,
                          itemCount: schedule.doctorSchedules.length,
                          itemBuilder: (BuildContext context, int index) {
                            final DoctorSchedule slot =
                                schedule.doctorSchedules[index];
                            return ToggleableTag<DoctorSchedule>(
                              enable: selectedShedule == slot.id,
                              onTap: () => setState(() {
                                selectedShedule = slot.id;
                              }),
                              text:
                                  '${DateTimeUtils.fromTimeToStringType2(slot.workTimeStart)}- ${DateTimeUtils.fromTimeToStringType2(slot.workTimeStart)}',
                            );
                          },
                        );
                      } else {
                        return CustomErrorWidget(
                          message: 'Chưa có lịch',
                          child: Image.asset(
                            ImageAssets.notFound,
                            height: 150,
                            width: 150,
                          ),
                        );
                      }
                    },
                    failed: (NetworkException e) => CustomErrorWidget(
                      message: e.toString(),
                      child: Image.asset(ImageAssets.errorResponse),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: AppElevatedButton(
            onPressed: () {
              context.showConfirmDialog(
                  title: AppText.t0('Lưu ý'),
                  content: AppText.b1(
                      'Vui lòng kiểm tra thông tin đặt khám một lần nữa '));
            },
            child: const Text('Đặt khám'),
          ),
        ),
      ),
    );
  }
}
