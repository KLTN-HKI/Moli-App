import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:moli_shared/moli_shared.dart';

class CourseBanner extends StatefulWidget {
  const CourseBanner({super.key});

  @override
  State<CourseBanner> createState() => _CourseBannerState();
}

class _CourseBannerState extends State<CourseBanner> {
  late final CarouselController _controller;

  late int _currentPage;

  final List<ImageBanner> bannerImages = const <ImageBanner>[
    ImageBanner(imageUrl: ImageAssets.banner, url: ''),
    ImageBanner(imageUrl: ImageAssets.banner, url: ''),
    ImageBanner(imageUrl: ImageAssets.banner, url: ''),
  ];

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          carouselController: _controller,
          items: bannerImages.map(_buildItem).toList(),
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              initialPage: _currentPage,
              disableCenter: true,
              height: 180,
              onPageChanged: (int index, CarouselPageChangedReason reason) =>
                  setState(() => _currentPage = index)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bannerImages
              .asMap()
              .entries
              .map((MapEntry<int, ImageBanner> entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(left: 4, right: 4, top: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == entry.key
                      ? (context.theme.brightness == Brightness.light
                          ? ColorPalettes.primary40
                          : ColorPalettes.primary80)
                      : ColorPalettes.neutral90,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  GestureDetector _buildItem(ImageBanner banner) {
    GestureTapCallback? onTap;

    if (banner.type == ImageBanner.typeGoRouter) {
      onTap = () {};
    }

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(banner.imageUrl, fit: BoxFit.fill),
      ),
    );
  }
}

class ImageBanner {
  const ImageBanner({
    required this.url,
    required this.imageUrl,
    this.type = ImageBanner.typeGoRouter,
  });

  static const int typeGoRouter = 1;
  static const int typeNetword = 2;

  final String url;
  final int type;
  final String imageUrl;
}
