import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../../bloc/appointment_rating/cubit/appointment_rating_cubit.dart';

class AppointmentRatingFooter extends StatelessWidget {
  const AppointmentRatingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final AppointmentRatingCubit cubit = context.read<AppointmentRatingCubit>();
    return BlocListener<AppointmentRatingCubit, AppointmentRatingState>(
      listener: (BuildContext context, AppointmentRatingState state) {
        if (state.status.isSuccess) {
          SmoothDialog(
            context: context,
            path: JsonAssets.successful,
            titleString: 'Đánh giá thành công',
            contentString: '',
            mode: SmoothMode.lottie,
          );
        }
      },
      child: BlocBuilder<AppointmentRatingCubit, AppointmentRatingState>(
        builder: (BuildContext context, AppointmentRatingState state) {
          if (state.status.isLoading) {
            return const LoadingIndicator();
          }
          return Row(
            children: <Widget>[
              TextButton(
                  onPressed: () async {
                    final bool result = await context.showConfirmDialog<bool>(
                        title: AppText.t0('Lưu ý').weight600,
                        content: AppText.t1(
                          'Bạn có chắc không đánh giá buổi hẹn này chứ?',
                        ));
                    if (result) {
                      cubit.skipRatingAppointment();
                    }
                  },
                  child: AppText.t1('Bỏ qua')),
              const SizedBox(width: 16),
              Expanded(
                child: AppElevatedButton(
                  expandedWith: false,
                  child: AppText.t0(
                    'Đánh giá',
                    color: ColorPalettes.white,
                  ),
                  onPressed: () {
                    cubit.ratingAppointment();
                  },
                ),
              ),
            ],
          ).marginSymmetric(vertical: 16, horizontal: 24);
        },
      ),
    );
  }
}
