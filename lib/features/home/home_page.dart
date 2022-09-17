import 'package:flutter/material.dart';
import 'package:moli_app/constants/image_assets.dart';
import 'package:moli_app/shared/shared.dart';
import 'components/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: RoundedImage(
              imageURL: ImageAssets.randomAvatar,
            ),
          ),
          leadingWidth: 56.w,
          title: AppText.t0('Châu Quốc An'),
        ),
        body: const HomeBody());
  }
}
