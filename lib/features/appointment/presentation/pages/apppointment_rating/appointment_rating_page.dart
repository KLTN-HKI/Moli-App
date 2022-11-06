import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/appointment/presentation/bloc/appointment_rating/cubit/appointment_rating_cubit.dart';
import 'package:moli_app/features/appointment/presentation/pages/apppointment_rating/components/rating_body.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../bloc/appointment/appointment_cubit.dart';
import 'components/rating_footer.dart';

class AppointmentRatingPage extends StatelessWidget {
  const AppointmentRatingPage({super.key, required this.appointmentUuid});

  final String appointmentUuid;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AppointmentCubit>(
          create: (BuildContext context) => AppointmentCubit(),
        ),
        BlocProvider<AppointmentRatingCubit>(
          create: (BuildContext context) =>
              AppointmentRatingCubit(appointmentUuid),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: const HeaderAppBar(
              titleText: 'Đánh giá buổi khám', transparentAppBar: true),
          body: AppointmentRatingBody(appointmentUuid: appointmentUuid),
          bottomNavigationBar: const AppointmentRatingFooter(),
        ),
      ),
    );
  }
}
