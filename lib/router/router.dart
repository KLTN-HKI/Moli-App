class Routes {
  const Routes._();

  /// Special router
  static const String notFound = '/not-found';
  static const String onBoarding = '/intro';
  static const String splashPage = '/splash';

  // Allow all permissions
  static final List<String> pageNotAuthen = <String>[
    splashPage,
    onBoarding,
    otp,
    checkPhoneNumber,
    register,
  ];

  /// Authentication router
  static const String auth = '/authentication';
  static const String otp = '/one-time-password';
  static const String login = '/login';
  static const String register = '/register';
  static const String checkPhoneNumber = '/check-phone-exist';

  /// Home router
  static const String home = '/home';
  static const String appointment = '/appointment';
  static const String notification = '/notification';
  static const String menu = '/menu';

  static const String hospitals = '/hospitals';
  static const String hospitalDetail = 'hospital';
  static const String doctors = 'doctors';
  static const String doctorDetail = 'doctor';
  static const String appointmentDetail = 'appointment';

  /// Other router
  static const String profile = 'profile';
}
