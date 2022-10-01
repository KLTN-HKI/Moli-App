import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moli_app/shared/shared.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  static const String routeName = 'notification';

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBar(
        title: Text(context.l10n.notification),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.more)),
        ],
      ),
      // body: SafeArea(
      //     child: ListView.separated(
      //         itemBuilder: (BuildContext context, int index) => ListTile(
      //               onTap: () {
      //                 Navigator.of(context).push(
      //                   MaterialPageRoute<dynamic>(
      //                     builder: (BuildContext context) =>
      //                         const NotificationDetailPage(),
      //                   ),
      //                 );
      //               },
      //               contentPadding:
      //                   EdgeInsets.symmetric(horizontal: 24.w, vertical: 4.w),
      //               leading: Stack(
      //                 clipBehavior: Clip.none,
      //                 children: const <Widget>[
      //                   AppIcon(
      //                     IconAssets.icNotiCalendar,
      //                     size: 48,
      //                     // color: context.colorScheme.errorContainer,
      //                   )
      //                   /* RoundedImage(
      //                       size: 48.w, imageURL: ImageAssets.randomAvatar),
      //                   Positioned(
      //                       bottom: -4.w,
      //                       right: -4.w,
      //                       child: const AppIcon(
      //                         IconAssets.icNotiCalendar,
      //                         size: 24,
      //                         // color: context.colorScheme.errorContainer,
      //                       )), */
      //                 ],
      //               ),
      //               title: AppText.t1(context.l10n.notification),
      //               subtitle: AppText.l2('Hôm nay | 13:00 PM'),
      //               trailing: Container(
      //                 padding: EdgeInsets.all(8.r),
      //                 decoration: BoxDecoration(
      //                     color: context.colorScheme.primary,
      //                     borderRadius: BorderRadius.circular(12.r)
      //                     // shape: BoxShape.circle,
      //                     ),
      //                 child: AppText.b2(
      //                   'New',
      //                   color: context.colorScheme.background,
      //                 ),
      //               ),
      //             ),
      //         separatorBuilder: (BuildContext context, int index) =>
      //             const SizedBox(),
      //         itemCount: 10)),
    );
  }
}
