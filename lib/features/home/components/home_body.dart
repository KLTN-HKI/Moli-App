import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/home/components/banner.dart';
import 'package:moli_app/features/hospital/presentation/cubit/hospital_cubit.dart';
import 'package:moli_app/shared/shared.dart';

import '../page/components/menu_body.dart';
import 'choose_hospital.dart';
import 'feature_buttons.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const BaseProfileCard(),
          SizedBox(height: 12.w),
          SizedBox(
            height: 110.w,
            child: const FeatureButtons(),
          ),
          SizedBox(height: 12.w),
          BlocProvider<HospitalCubit>(
            create: (BuildContext context) => HospitalCubit(),
            child: const ChooseHospitalBuilder(),
          ),
          SizedBox(height: 12.w),
          const CourseBanner(),
          SizedBox(height: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText.t0('Tin y tế')
                  .weight500
                  .paddingSymmetric(horizontal: 24.w),
            ],
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
