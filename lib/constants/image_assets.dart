import 'dart:math';

class ImageAssets {
  ImageAssets._();

  static const String path = 'assets/images';

  static const String appIcon = '$path/moli.png';

  static const String background = '$path/background.png';
  static const String backgroundAuth = '$path/authentication_background.png';

  static const String avatar = '$path/avatar.png';
  static const String doctor = '$path/doctor.png';
  static const String doctors = '$path/doctors.png';

  static const String doctors1 = '$path/doctors_1.png';

  static const String errorResponse = '$path/error_response.png';
  static const String noInternet = '$path/no_internet.png';
  static const String notFound = '$path/not_found.png';
  static const String otherError = '$path/other_error.png';
  static const String otpVerify = '$path/otp_verify.png';
  static const String requestFail = '$path/request_fail.png';
  static const String resetPassword = '$path/reset_password.png';
  static const String rocket = '$path/rocket.png';
  static const String noSchedule = '$path/no_schedule.png';
  static const String login = '$path/login.png';

  static const String banner = '$path/banner.jpeg';
  static const String hospital1 = '$path/hospital.png';
  static const String hospital =
      'https://img.freepik.com/premium-vector/hospital-building-icon-flat-style-medical-clinic-vector-illustration-isolated-background-medicine-sign-business-concept_157943-865.jpg?w=1060';

  static String randomAvatar =
      'https://picsum.photos/1920/1080?random=${Random().nextInt(999)}';
  static String randomImage =
      'https://picsum.photos/1920/1080?random=${Random().nextInt(999)}';
}
