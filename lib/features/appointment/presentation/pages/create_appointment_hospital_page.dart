import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moli_app/constants/constants.dart';
import 'package:moli_app/features/appointment/domain/appointment_request.dart';
import 'package:moli_app/features/appointment/domain/formz/datetime_picker.dart';
import 'package:moli_app/features/appointment/presentation/bloc/appointment/appointment_cubit.dart';
import 'package:moli_app/features/authentication/authentication.dart';
import 'package:moli_app/shared/shared.dart';

import '../../../../shared/widgets/tag/toggleable_tag.dart';
import '../../../authentication/domain/response/response.dart';
import '../../../doctor/domain/doctor.dart';
import '../../../doctor/domain/schedule.dart';
import '../../../doctor/presentation/bloc/bloc.dart';
import '../bloc/appointment_form/appointment_form_cubit.dart';
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
  late final AppointmentFormCubit _formCubit;
  late DateTime selectedDate;
  int? selectedShedule;
  bool forSelf = true;
  UserModel? patient;
  @override
  void initState() {
    super.initState();
    _bloc = ScheduleBloc();
    _formCubit = AppointmentFormCubit();
    selectedDate = DateTime.now();
    if (widget.extra != null && widget.extra is Doctor) {
      _doctor = widget.extra! as Doctor;
    }
    final AuthenticationBloc authBloc = context.read<AuthenticationBloc>();
    patient =
        authBloc.state.whenOrNull(authenticated: (UserModel user) => user);
  }

  void _fetchSchduleByDate(DateTime? selectedDate) {
    if (selectedDate != null) {
      _bloc.add(ScheduleEvent.fetchSchedule(
          doctorId: _doctor.id,
          dayOfYear: DateFormat('yyyy-MM-dd').format(selectedDate)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<ScheduleBloc>.value(
          value: _bloc,
        ),
        BlocProvider<AppointmentFormCubit>.value(
          value: _formCubit,
        ),
      ],
      child: BlocConsumer<AppointmentFormCubit, AppointmentFormState>(
        listener: (BuildContext context, AppointmentFormState state) {},
        builder: (BuildContext context, AppointmentFormState state) {
          return Scaffold(
            appBar: const HeaderAppBar(
              titleText: 'Đặt khám',
            ),
            body: BlocConsumer<AppointmentFormCubit, AppointmentFormState>(
              listener: (BuildContext context, AppointmentFormState state) {},
              builder: (BuildContext context, AppointmentFormState state) {
                return SingleChildScrollView(
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
                        children: <Widget>[
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
                        AppText.b1('Tên bệnh nhân: //${patient?.name ?? ''}'),
                        const SizedBox(height: 4),
                        AppText.b1('Giới tính: ${patient?.gender ?? ''}'),
                        const SizedBox(height: 4),
                        AppText.b1('Email: ${patient?.email ?? ''}'),
                        const SizedBox(height: 4),
                        AppText.b1(
                            'Số điện thoại: ${patient?.realPhoneNumber ?? ''}'),
                        const SizedBox(height: 4),
                      ],
                      const SizedBox(height: 4),
                      AppText.t0('Ngày khám:').bold,
                      const SizedBox(height: 4),
                      AppointmentDateTimePicker(
                        label: 'Ngày khám',
                        initialDate: state.appointmentDate.value,
                        invalid: state.appointmentDate.invalid,
                        onChange: (DateTime? value) {
                          // selectedDate = value!;
                          _formCubit.changeAppointmentDate(value);
                          _fetchSchduleByDate(value);
                        },
                      ),
                      const SizedBox(height: 12),
                      BlocBuilder<ScheduleBloc, ScheduleState>(
                        builder: (BuildContext context, ScheduleState state) {
                          return state.when(
                            initial: () =>
                                AppText.b0('Vui lòng chọn ngày khám'),
                            success:
                                (DoctorAvailableTime schedule, bool isLoading) {
                              if (schedule.doctorSchedules.isNotEmpty) {
                                return GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 150,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: schedule.doctorSchedules.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final DoctorSchedule slot =
                                        schedule.doctorSchedules[index];
                                    return ToggleableTag<DoctorSchedule>(
                                      enable: selectedShedule == slot.id,
                                      onTap: () => setState(() {
                                        selectedShedule = slot.id;
                                      }),
                                      text:
                                          '${DateTimeUtils.fromTimeToStringType2(slot.workTimeStart)} - ${DateTimeUtils.fromTimeToStringType2(slot.workTimeStart)}',
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
                );
              },
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: AppElevatedButton(
                onPressed: () async {
                  final bool result = await context.showConfirmDialog(
                    title: AppText.t0('Lưu ý'),
                    content: AppText.b1(
                        'Vui lòng kiểm tra thông tin đặt khám một lần nữa '),
                  );

                  if (result) {
                    if (patient != null) {
                      _formCubit.submit(AppointmentRequest(
                        doctorId: _doctor.id,
                        doctorScheduleId: selectedShedule!,
                        patientId: patient!.id!,
                        emailPatient: patient!.email,
                        patientName: patient!.name,
                        genderPatient: patient!.gender,
                        forSelf: forSelf,
                        patientRealPhoneNumber: patient!.realPhoneNumber,
                        hospitalId: widget.hospitalId,
                        describeSymptoms: '',
                      ));
                    }
                  }
                },
                child: const Text('Đặt khám'),
              ),
            ),
          );
        },
      ),
    );
  }
}
