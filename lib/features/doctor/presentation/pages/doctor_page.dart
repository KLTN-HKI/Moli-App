import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moli_app/shared/shared.dart';

import '../bloc/bloc.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DoctorBloc>(
      create: (BuildContext context) => DoctorBloc(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: HeaderAppBar(
          transparentAppBar: true,
          titleText: 'Doctors',
        ),
        body: SafeArea(child: DoctorBody()),
      ),
    );
  }
}

class DoctorBody extends StatefulWidget {
  const DoctorBody({super.key});

  @override
  State<DoctorBody> createState() => _DoctorBodyState();
}

class _DoctorBodyState extends State<DoctorBody> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
