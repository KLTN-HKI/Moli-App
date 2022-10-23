import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:moli_app/features/appointment/domain/appointment_request.dart';
import 'package:moli_app/features/authentication/authentication.dart';
import 'package:moli_app/router/router.dart';
import 'package:moli_shared/moli_shared.dart';

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
          if (state.isSucess) {
            SmoothDialog(
              context: context,
              path: ImageAssets.send,
              title: 'Thành công',
              content: 'Bạn đã đặt lịch khám thành công',
              mode: SmoothMode.asset,
              dialogType: DialogType.error,
              onDismiss: () => context.goRouter.go(Routes.appointment),
            );
          } else if (state.exception != null) {
            context.showNetworkExceptionDialog(state.exception!);
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
                        /* const SizedBox(width: 16),
                          AppRadio<bool>(
                            groupValue: forSelf,
                            onChanged: (bool? value) {
                              setState(() {
                                patient = context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .whenOrNull(
                                        authenticated: (UserModel user) =>
                                            user);
                                forSelf = value!;
                              });
                            },
                            value: false,
                          ),
                          AppText.b1('Cho người khác'), */
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
                        onFieldSubmitted: (String value) {
                          setState(() {
                            patient?.copyWith;
                          });
                        },
                      ),
                      const SizedBox(height: 4),
                      AppText.b1('Giới tính:'),
                      Row(
                        children: <Widget>[
                          AppRadio<Gender>(
                            groupValue: gender,
                            onChanged: (Gender? value) {
                              setState(() {
                                patient?.copyWith(gender: value);
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
                                patient?.copyWith(gender: value);
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
                        onFieldSubmitted: (String value) =>
                            patient?.copyWith(email: value),
                      ),
                      const SizedBox(height: 4),
                      AppText.b1('Số điện thoại:'),
                      TextFormField(
                        style: context.textTheme.bodyMedium,
                        keyboardType: TextInputType.phone,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onFieldSubmitted: (String value) =>
                            patient?.copyWith(realPhoneNumber: value),
                      ),
                    ],
                  ],
                ).paddingSymmetric(horizontal: 16),
                const SizedBox(height: 12),
                AppText.t0('Ngày khám:').bold.paddingSymmetric(horizontal: 16),
                const SizedBox(height: 12),
                AppointmentDateTimePicker(
                  label: 'Ngày khám',
                  initialDate: state.appointmentDate.value,
                  invalid: state.appointmentDate.invalid,
                  onChange: (DateTime? value) {
                    _formCubit.changeAppointmentDate(value);
                    _fetchSchduleByDate(value);
                  },
                ).paddingSymmetric(horizontal: 16),
                const SizedBox(height: 12),
                BlocBuilder<ScheduleBloc, ScheduleState>(
                  builder: (BuildContext context, ScheduleState state) {
                    return state.when(
                      initial: () =>
                          Center(child: AppText.b0('Vui lòng chọn ngày khám')),
                      success: (DoctorAvailableTime schedule, bool isLoading) {
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
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: AppElevatedButton(
                isLoading: state.isLoading,
                onPressed: (selectedShedule != null &&
                        state.appointmentDate.value != null)
                    ? selectedShedule!.workTimeStart!
                            .copyWith(
                              year: state.appointmentDate.value?.year,
                              month: state.appointmentDate.value?.month,
                              day: state.appointmentDate.value?.day,
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
                                _formCubit.submit(AppointmentRequest(
                                  doctorId: _doctor.id,
                                  doctorScheduleId: selectedShedule!.id,
                                  patientId: patient!.id!,
                                  emailPatient: patient!.email,
                                  patientName: patient!.name,
                                  genderPatient: patient?.gender!.gender,
                                  forSelf: forSelf,
                                  patientRealPhoneNumber:
                                      patient!.realPhoneNumber,
                                  hospitalId: widget.hospitalId,
                                  describeSymptoms: '',
                                ));
                              }
                            }
                          }
                        : () {
                            SmoothDialog(
                              context: context,
                              path: ImageAssets.warning,
                              imageHeight: 200,
                              imageWidth: 200,
                              title: 'Lưu ý',
                              content:
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
                          title: 'Lưu ý',
                          content: 'Vui lòng chọn thời gian khám',
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
