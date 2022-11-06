import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/features/home/components/banner.dart';
import 'package:moli_shared/moli_shared.dart';

import '../../hospital/presentation/cubit/hospital_list/hospital_list_cubit.dart';
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
  /* final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey(); */

  bool? isShowcase = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    init();
  }

  Future<void> init() async {
    /* isShowcase = await _authSerive.getShowcase();
    if (isShowcase == null || isShowcase!) {
      print(isShowcase);
      setState(() {
        ShowCaseWidget.of(context)
            .startShowCase([_one, _two, _three, _four, _five]);
      });
    } */
  }

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
          const SizedBox(height: 12),
          const SizedBox(
            height: 110,
            child: FeatureButtons(),
          ),
          const SizedBox(height: 12),
          BlocProvider<HospitalListCubit>(
            create: (BuildContext context) => HospitalListCubit(),
            child: const ChooseHospitalBuilder(),
          ),
          const SizedBox(height: 12),
          const CourseBanner(),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText.t0('Tin y tế').weight500.paddingSymmetric(horizontal: 24),
            ],
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
