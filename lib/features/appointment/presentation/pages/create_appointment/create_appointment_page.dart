import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moli_app/features/appointment/domain/appointment.dart';

import 'package:moli_app/features/authentication/authentication.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../../authentication/domain/response/response.dart';
import '../../../../doctor/domain/doctor.dart';
import '../../../../doctor/domain/schedule.dart';
import '../../../../doctor/presentation/bloc/bloc.dart';
import '../../bloc/appointment_form/appointment_form_cubit.dart';
import '../appointment/components/date_picker.dart';

class CreateAppointmentPage extends StatefulWidget {
  const CreateAppointmentPage({
    super.key,
    required this.doctorId,
    this.extra,
  });

  final String doctorId;
  final Object? extra;

  static String routeName = 'create-appointment';

  @override
  State<CreateAppointmentPage> createState() => _CreateAppointmentPageState();
}

class _CreateAppointmentPageState extends State<CreateAppointmentPage> {
  late Doctor _doctor;
  late final ScheduleBloc _bloc;
  late final AppointmentFormCubit _formCubit;
  DoctorSchedule? selectedShedule;
  bool forSelf = true;
  Gender gender = Gender.male;
  UserModel? patient;

  @override
  void initState() {
    super.initState();
    _bloc = ScheduleBloc();
    _formCubit = AppointmentFormCubit();
    if (widget.extra != null && widget.extra is Doctor) {
      _doctor = widget.extra! as Doctor;
    }
    final AuthenticationBloc authBloc = context.read<AuthenticationBloc>();
    patient =
        authBloc.state.whenOrNull(authenticated: (UserModel user) => user);
  }

  @override
  void dispose() {
    _bloc.close();
    _formCubit.close();
    super.dispose();
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
        BlocProvider<ScheduleBloc>.value(value: _bloc),
        BlocProvider<AppointmentFormCubit>.value(value: _formCubit),
      ],
      child: BlocConsumer<AppointmentFormCubit, AppointmentFormState>(
        listener: (BuildContext context, AppointmentFormState state) {
          if (state.exception != null) {
            context.showNetworkExceptionDialog(state.exception!);
          } else if (state.isSucess) {
            final Appointment? appointment = state.appointment;
            SmoothDialog(
              context: context,
              mode: SmoothMode.asset,
              path: ImageAssets.send,
              titleString: 'Đặt lịch thành công',
              contentString: 'Bạn đã đặt lịch khám thành công',
              content: Column(
                children: <Widget>[
                  AppText.b1(
                    'Bạn đã đặt lịch khám với bác sĩ vào lúc ${DateTimeUtils.formatTime(appointment?.appointmentStartTime, hmOnly: true)}, ${DateTimeUtils.formatDateTimeDateOnly(appointment?.appointmentBookingDate)}',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              onDismiss: () =>
                  _fetchSchduleByDate(state.patientForm.appointmentDate.value),
              customActions: Column(
                children: <Widget>[
                  const SizedBox(height: 4),
                  AppElevatedButton(
                    onPressed: () =>
                        Navigator.of(context, rootNavigator: true).pop(),
                    height: 40,
                    child: AppText.t1(
                      'Done',
                      color: context.colorScheme.background,
                    ).weight500,
                  ),
                  TextButton(
                    onPressed: () => context.goRouter.go(
                        '/appointment/detail/${appointment?.appointmentUuid}'),
                    child: AppText.t1('Xem chi tiết'),
                  )
                ],
              ),
            );
          }
        },
        builder: (BuildContext context, AppointmentFormState state) {
          return Scaffold(
            appBar: const HeaderAppBar(
              titleText: 'Đặt khám',
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: <Widget>[
                _DoctorInfo(doctor: _doctor),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                              patient = context
                                  .read<AuthenticationBloc>()
                                  .state
                                  .whenOrNull(
                                      authenticated: (UserModel user) => user);
                              forSelf = value!;
                            });
                          },
                          value: false,
                        ),
                        AppText.b1('Cho người khác'),
                      ],
                    ),
                    if (forSelf) ...<Widget>[
                      const SizedBox(height: 4),
                      AppText.b1(
                          'Tên bệnh nhân: ${patient?.name ?? '(Chưa cập nhật thông tin)'}'),
                      const SizedBox(height: 4),
                      AppText.b1(
                          'Giới tính: ${patient?.gender ?? '(Chưa cập nhật thông tin)'}'),
                      const SizedBox(height: 4),
                      AppText.b1(
                          'Email: ${patient?.email ?? '(Chưa cập nhật thông tin)'}'),
                      const SizedBox(height: 4),
                      AppText.b1(
                          'Số điện thoại: ${patient?.realPhoneNumber ?? '(Chưa cập nhật thông tin)'}'),
                      const SizedBox(height: 4),
                    ] else ...<Widget>[
                      AppText.b1('Tên bệnh nhân:'),
                      TextFormField(
                        style: context.textTheme.bodyMedium,
                        initialValue: state.patientForm.patientName.value,
                        onChanged: _formCubit.nameChanged,
                      ),
                      const SizedBox(height: 4),
                      AppText.b1('Giới tính:'),
                      Row(
                        children: <Widget>[
                          AppRadio<Gender>(
                            groupValue: gender,
                            onChanged: (Gender? value) {
                              setState(() {
                                patient = patient?.copyWith(gender: value);
                                gender = value!;
                              });
                            },
                            value: Gender.male,
                          ),
                          AppText.b1('Nam'),
                          const SizedBox(width: 16),
                          AppRadio<Gender>(
                            groupValue: gender,
                            onChanged: (Gender? value) {
                              setState(() {
                                patient = patient?.copyWith(gender: value);
                                gender = value!;
                              });
                            },
                            value: Gender.female,
                          ),
                          AppText.b1('Nữ'),
                        ],
                      ),
                      const SizedBox(height: 4),
                      AppText.b1('Email:'),
                      TextFormField(
                        style: context.textTheme.bodyMedium,
                        // onChanged: (String value) => setState(() {
                        //   patient = patient?.copyWith(email: value);

                        // }),
                        onChanged: _formCubit.emailChanged,
                      ),
                      const SizedBox(height: 4),
                      AppText.b1('Số điện thoại:'),
                      TextFormField(
                        style: context.textTheme.bodyMedium,
                        keyboardType: TextInputType.phone,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        // onChanged: (String value) => setState(() {
                        //   patient = patient?.copyWith(realPhoneNumber: value);
                        // }),
                        onChanged: _formCubit.phoneNumberChanged,
                      ),
                    ],
                  ],
                ).paddingSymmetric(horizontal: 16),
                const SizedBox(height: 12),
                AppText.t0('Ngày khám:').bold.paddingSymmetric(horizontal: 16),
                const SizedBox(height: 12),
                AppointmentDateTimePicker(
                  label: 'Ngày khám',
                  initialDate: DateTime.now().hour > 12
                      ? DateTime.now().add(const Duration(days: 1)).dateOnly
                      : state.patientForm.appointmentDate.value,
                  minimumDate: DateTime.now().hour > 12
                      ? DateTime.now().add(const Duration(days: 1)).dateOnly
                      : null,
                  invalid: state.patientForm.appointmentDate.invalid,
                  onChange: (DateTime? value) {
                    _formCubit.changeAppointmentDate(value);
                    _fetchSchduleByDate(value);
                  },
                ).paddingSymmetric(horizontal: 16),
                const SizedBox(height: 12),
                BlocBuilder<ScheduleBloc, ScheduleState>(
                  builder: (BuildContext context, ScheduleState state) {
                    switch (state.status) {
                      case StateStatus.loading:
                        return const LoadingIndicator();
                      case StateStatus.success:
                        final DoctorAvailableTime schedule = state.schedule;
                        if (schedule.doctorSchedules.isNotEmpty) {
                          return GridView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 68,
                              crossAxisSpacing: 10,
                            ),
                            shrinkWrap: true,
                            itemCount: schedule.doctorSchedules.length,
                            itemBuilder: (BuildContext context, int index) {
                              final DoctorSchedule slot =
                                  schedule.doctorSchedules[index];
                              return ToggleableTag<DoctorSchedule>(
                                enable: selectedShedule == slot,
                                // isDense: true,
                                onTap: () {
                                  setState(() {
                                    if (selectedShedule != slot) {
                                      selectedShedule = slot;
                                    } else {
                                      selectedShedule = null;
                                    }
                                  });
                                },
                                text:
                                    '${DateTimeUtils.fromTimeToStringType2(slot.workTimeStart)}',
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
                      case StateStatus.initial:
                      case StateStatus.updated:
                        return Center(
                            child: AppText.b0('Vui lòng chọn ngày khám'));
                      case StateStatus.failure:
                        return CustomErrorWidget(
                          message: state.exception.toString(),
                          child: Image.asset(ImageAssets.errorResponse),
                        );
                    }
                  },
                )
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: AppElevatedButton(
                isLoading: state.isLoading,
                onPressed: (selectedShedule != null &&
                        state.patientForm.appointmentDate.value != null)
                    ? selectedShedule!.workTimeStart!
                            .copyWith(
                              year:
                                  state.patientForm.appointmentDate.value?.year,
                              month: state
                                  .patientForm.appointmentDate.value?.month,
                              day: state.patientForm.appointmentDate.value?.day,
                            )
                            .isAfter(DateTime.now())
                        ? () async {
                            final bool result = await context.showConfirmDialog(
                              title: AppText.t0('Lưu ý'),
                              content: AppText.b1(
                                  'Vui lòng kiểm tra thông tin đặt khám một lần nữa '),
                            );

                            if (result) {
                              if (patient != null) {
                                _formCubit.submit(
                                    doctorId: _doctor.id,
                                    doctorScheduleId: selectedShedule!.id,
                                    hospitalId: _doctor.hospital!.id,
                                    gender: gender,
                                    forSelf: forSelf,
                                    currentUser: forSelf ? patient : null);
                                // _formCubit.submit();
                                /*   _formCubit.submit(AppointmentRequest(
                                  doctorId: _doctor.id,
                                  doctorScheduleId: selectedShedule!.id,
                                  patientId: patient!.id!,
                                  emailPatient: patient!.email,
                                  patientName: patient!.name,
                                  genderPatient: patient?.gender!.gender,
                                  forSelf: forSelf,
                                  patientRealPhoneNumber:
                                      patient!.realPhoneNumber,
                                  hospitalId: _doctor.hospital?.id,
                                  describeSymptoms: '',
                                )); */
                              }
                            }
                          }
                        : () {
                            SmoothDialog(
                              context: context,
                              path: ImageAssets.warning,
                              imageHeight: 200,
                              imageWidth: 200,
                              titleString: 'Lưu ý',
                              contentString:
                                  'Vui lòng chọn thời gian khám sau thời gian hiện tại',
                              mode: SmoothMode.asset,
                              dialogType: DialogType.error,
                            );
                          }
                    : () {
                        SmoothDialog(
                          context: context,
                          path: ImageAssets.warning,
                          imageHeight: 200,
                          imageWidth: 200,
                          titleString: 'Lưu ý',
                          contentString: 'Vui lòng chọn thời gian khám',
                          mode: SmoothMode.asset,
                          dialogType: DialogType.error,
                        );
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

class _DoctorInfo extends StatelessWidget {
  const _DoctorInfo({
    required Doctor doctor,
  }) : _doctor = doctor;

  final Doctor _doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BaseCard(
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
    );
  }
}
