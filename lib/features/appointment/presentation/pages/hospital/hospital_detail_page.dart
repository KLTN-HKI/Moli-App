import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moli_app/constants/image_assets.dart';
import 'package:moli_app/shared/shared.dart';

class HospitalDetailPage extends StatelessWidget {
  const HospitalDetailPage({super.key});

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
              background: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: <Widget>[
                  Image.asset(
                    ImageAssets.appIcon,
                    // height: 200.w,
                  ),
                  Positioned(
                    bottom: -100,
                    child: Container(
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary,
                        ),
                        height: 100,
                        width: 200,
                        child: AppText.h0('Bệnh viện ...')),
                  ),
                  // centerTitle: false,
                ],
              ),
            ),
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(Iconsax.archive_1)),
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
