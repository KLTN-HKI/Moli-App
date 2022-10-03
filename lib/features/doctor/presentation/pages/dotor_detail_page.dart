import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moli_app/features/doctor/domain/doctor.dart';
import 'package:moli_app/shared/shared.dart';

class DoctorDetailPage extends StatefulWidget {
  const DoctorDetailPage({super.key, required this.doctorId, this.extra});

  final int doctorId;
  final Object? extra;

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  late Doctor _doctor;
  @override
  void initState() {
    super.initState();
    if (widget.extra != null && widget.extra is Doctor) {
      _doctor = widget.extra! as Doctor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: HeaderAppBar(
        transparentAppBar: true,
        titleText: _doctor.name,
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.heart)),
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.more)),
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseCard(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                leading: const RoundedRectImage(
                  imageURL: '',
                  height: 100,
                  width: 100,
                ),
                content: [
                  AppText.b0(_doctor.name ?? '').weight600,
                  const Divider(),
                  AppText.b2(_doctor.degree?.degreeName ?? ''),
                  const SizedBox(height: 4),
                  AppText.b2(_doctor.address ?? 'Địa chỉ...'),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.t0('About me ').bold,
                  AppText.b0(_doctor.toString())
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.t0('Working time ').bold,
                ],
              )
            ],
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: AppElevatedButton(
          onPressed: () {},
          child: const Text('Book doctor'),
        ),
      ),
    );
  }
}
