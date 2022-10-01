import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/constants/image_assets.dart';
import 'package:moli_app/shared/shared.dart';

class HospitalDetailPage extends StatelessWidget {
  const HospitalDetailPage({super.key, required this.hospitalId, this.extra});

  final int hospitalId;
  final Object? extra;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarSliver(
            expandedHeight: 200,
            canBack: true,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              background: CachedNetworkImage(
                imageUrl: '',
                errorWidget: (_, __, ___) => Image.asset(
                  ImageAssets.appIcon,
                  fit: BoxFit.cover,
                ),
              ),
              centerTitle: true,
              // titlePadding: ,
              title: AppText.t0(
                'Bệnh viện ...',
                // color: ColorPalettes.white,
              ).weight600,
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.archive_1,
                    color: ColorPalettes.black,
                  )),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 50.0,
                    child: Center(
                      child: Text('$index', textScaleFactor: 1),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
