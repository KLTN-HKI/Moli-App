import 'dart:math';

class ImageAssets {
  ImageAssets._();

  static const String path = 'assets/images';

  static const String appIcon = '$path/';
  static const String background = '$path/background.png';
  static const String backgroundAuth = '$path/authentication_background.png';

  static const String avatar = '$path/avatar.png';

  static String randomAvatar =
      'https://picsum.photos/1920/1080?random=${Random().nextInt(999)}';
  static String randomImage =
      'https://picsum.photos/1920/1080?random=${Random().nextInt(999)}';
}
