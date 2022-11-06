import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moli_app/features/appointment/presentation/bloc/appointment_rating/cubit/appointment_rating_cubit.dart';
import 'package:moli_shared/moli_shared.dart';
import '../../../../../doctor/domain/doctor.dart';
import '../../../../domain/appointment.dart';
import '../../../bloc/appointment/appointment_cubit.dart';
import '../../components/appointment_card.dart';

class AppointmentRatingBody extends StatefulWidget {
  const AppointmentRatingBody({super.key, required this.appointmentUuid});

  final String appointmentUuid;

  @override
  State<AppointmentRatingBody> createState() => _AppointmentRatingBodyState();
}

class _AppointmentRatingBodyState extends State<AppointmentRatingBody> {
  late AppointmentCubit _cubit;
  late double _rating;
  late TextEditingController comment;

  @override
  void initState() {
    super.initState();
    _rating = 3.0;
    comment = TextEditingController();
    _cubit = context.read<AppointmentCubit>();

    _cubit.getAppointmentByUuid(widget.appointmentUuid);
  }

  @override
  void dispose() {
    _cubit.close();
    comment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit, AppointmentState>(
      bloc: _cubit,
      listener: (BuildContext context, AppointmentState state) {},
      builder: (BuildContext context, AppointmentState state) {
        final Appointment appointment = state.appointment;
        return LoadingOpacity(
          loading: state.isLoading,
          isOpacity: false,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: <Widget>[
                  AppointmentCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const RoundedRectImage(
                              height: 40,
                              width: 40,
                              customErrorImage: CustomErrorImage(
                                errorImage: ImageAssets.hospital1,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                                child: AppText.t0(
                                        '${appointment.hospital?.hospitalName}')
                                    .weight600),
                          ],
                        ),
                        const SizedBox(height: 8),
                        AppText.t1('Địa chỉ'),
                        const SizedBox(height: 4),
                        AppText.t1(
                                '${appointment.hospital?.hospitalAddress?.addressDetail}')
                            .weight500,
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            AppText.b0('Bác sĩ'),
                            AppText.b0(
                              '${appointment.doctor?.name}',
                            ).weight600,
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            AppText.b0('Chuyên khoa'),
                            AppText.b0(
                              '${appointment.doctor?.specialists.map((Specialist specialist) => specialist.specialistName).join('\n')}',
                            ).weight600,
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppointmentCard(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // AppText.t0('${appointment.hospital?.hospitalName}')
                        //     .bold,
                        // const SizedBox(height: 4),
                        // AppText.t0(
                        //   '${appointment.appointmentStatus}',
                        //   color: _appointmentStatusColor(
                        //       appointment.appointmentStatus ??
                        //           AppointmentStatus.pending),
                        // ).weight500,
                        // const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            AppText.b0('Mã lịch hẹn'),
                            AppText.b0('${appointment.appointmentCode}')
                                .weight600,
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            AppText.b0('Ngày khám'),
                            AppText.b0(
                                    '${DateTimeUtils.formatDateTimeDateOnly(appointment.appointmentBookingDate)}')
                                .weight600,
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            AppText.b0('Giờ khám'),
                            AppText.b0(
                              '${DateTimeUtils.fromTimeToStringType2(appointment.appointmentStartTime)} - ${DateTimeUtils.fromTimeToStringType2(appointment.appointmentEndTime)}',
                              color: context.colorScheme.error,
                            ).weight600,
                          ],
                        ),
                      ],
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: _rating,
                    // allowHalfRating: true,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                    wrapAlignment: WrapAlignment.spaceEvenly,
                    itemBuilder: (BuildContext context, int index) {
                      switch (index) {
                        case 0:
                          return const Icon(
                            Icons.sentiment_very_dissatisfied,
                            color: Colors.red,
                          );
                        case 1:
                          return const Icon(
                            Icons.sentiment_dissatisfied,
                            color: Colors.redAccent,
                          );
                        case 2:
                          return const Icon(
                            Icons.sentiment_neutral,
                            color: Colors.amber,
                          );
                        case 3:
                          return const Icon(
                            Icons.sentiment_satisfied,
                            color: Colors.lightGreen,
                          );
                        case 4:
                          return const Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.green,
                          );
                        default:
                          return const SizedBox();
                      }
                    },
                    onRatingUpdate: (double rating) {
                      // setState(() {
                      //   _rating = rating;
                      // });
                      context
                          .read<AppointmentRatingCubit>()
                          .ratingChanged(rating);
                    },
                  ),
                  BlocBuilder<AppointmentRatingCubit, AppointmentRatingState>(
                    buildWhen: (AppointmentRatingState previous,
                            AppointmentRatingState current) =>
                        previous.rating != current.rating,
                    builder:
                        (BuildContext context, AppointmentRatingState state) {
                      return AppText.t1(_ratingToText(state.rating.ceil()));
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppText.t1('Nhận xét').weight500,
                      const SizedBox(height: 8),
                      TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                            hintText: 'Nhận xét về buổi khám',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onChanged: (String value) => context
                            .read<AppointmentRatingCubit>()
                            .commentChanged(value),
                      ),
                    ],
                  )
                ].applySeparator(separator: const SizedBox(height: 16)),
              ),
            ),
          ),
        );
      },
    );
  }

  String _ratingToText(int rating) {
    switch (rating) {
      case 1:
        return 'Rất không hài lòng';
      case 2:
        return 'Không hài lòng';
      case 3:
        return 'Bình thường';
      case 4:
        return 'Hài lòng';
      case 5:
        return 'Rất hài lòng';
      default:
        return '';
    }
  }
}
