import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moli_app/app/bloc/bloc.dart';
import 'package:moli_app/features/appointment/presentation/pages/appointment_detail/appointment_detail.dart';
import 'package:moli_app/features/appointment/presentation/pages/create_appointment_hospital_page.dart';
import 'package:moli_app/features/authentication/presentation/register/page/register_page.dart';
import 'package:moli_app/features/doctor/presentation/pages/doctor_detail_page.dart';
import 'package:moli_app/features/error/error_page.dart';
import 'package:moli_app/features/features.dart';
import 'package:moli_app/features/home/page/menu_page.dart';
import 'package:moli_app/features/hospital/presentation/pages/hospital_page.dart';
import 'package:moli_app/shared/shared.dart';

import '../features/authentication/presentation/check_user/page/check_phone_page.dart';
import '../features/doctor/presentation/pages/components/hospital_doctors.dart';
import '../features/doctor/presentation/pages/doctor_page.dart';
import 'go_router_refresh_stream.dart';
import 'router.dart';
import 'transition_page.dart';

final GlobalKey<NavigatorState> moliNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> moliShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

GoRouter routing(BuildContext context, String? initialLocation) {
  final AppBloc appBloc = context.read<AppBloc>();
  return GoRouter(
    initialLocation: Routes.splashPage,
    debugLogDiagnostics: true,
    navigatorKey: moliNavigatorKey,
    observers: <NavigatorObserver>[MoliAnalytics.instance.observer],
    refreshListenable: GoRouterRefreshStream(appBloc.stream),
    redirect: (_, GoRouterState state) {
      // Page allow all user
      if (Routes.pageNotAuthen
          .any((String path) => state.subloc.contains(path))) {
        return null;
      }

      final bool isAuth = state.subloc.contains(Routes.auth);

      final String? page = appBloc.state.maybeWhen<String?>(
        home: () => isAuth ? Routes.home : null,
        orElse: () => !isAuth ? Routes.auth : null,
      );

      return page;
    },
    routes: <RouteBase>[
      GoRoute(path: '/', redirect: (_, __) => Routes.home),
      GoRoute(
        path: Routes.splashPage,
        pageBuilder: (_, __) =>
            const CupertinoDialogTransitionPage(child: SplashPage()),
      ),
      GoRoute(
        path: Routes.onBoarding,
        pageBuilder: (_, __) =>
            const CupertinoDialogTransitionPage(child: IntroductionPage()),
      ),
      GoRoute(
        path: Routes.auth,
        name: Routes.auth,
        pageBuilder: (_, __) =>
            const CupertinoDialogTransitionPage(child: LoginPage()),
        routes: <RouteBase>[
          GoRoute(
            path: LoginPage.routeName,
            pageBuilder: (_, __) =>
                const NoTransitionPage<void>(child: LoginPage()),
          ),
          GoRoute(
            path: CheckPhoneNumberPage.routeName,
            pageBuilder: (_, __) => const CupertinoDialogTransitionPage(
                child: CheckPhoneNumberPage()),
          ),
          GoRoute(
            path: OTPPage.routeName,
            pageBuilder: (_, GoRouterState state) =>
                const CupertinoTransitionPage(child: OTPPage()),
          ),
          GoRoute(
            path: RegisterPage.routeName,
            pageBuilder: (_, __) =>
                const CupertinoDialogTransitionPage(child: RegisterPage()),
          ),
        ],
      ),
      // * Dashboard
      ShellRoute(
        navigatorKey: moliShellNavigatorKey,
        pageBuilder: (_, GoRouterState state, Widget child) =>
            NoTransitionPage<DashBoard>(
                child: DashBoard(location: state.location, child: child)),
        routes: <RouteBase>[
          // * Home
          GoRoute(
            path: Routes.home,
            name: Routes.home,
            pageBuilder: (_, __) => const FadeTransitionPage(child: HomePage()),
            // routes: <GoRoute>[],
          ),
          // * Appointments
          GoRoute(
            path: Routes.appointment,
            name: Routes.appointment,
            pageBuilder: (_, __) =>
                const FadeTransitionPage(child: AppointmentPage()),
            routes: <GoRoute>[
              GoRoute(
                path: '${AppointmentDetailPage.routePath}/:appointmentId',
                parentNavigatorKey: moliNavigatorKey,
                pageBuilder: (_, GoRouterState state) =>
                    CupertinoTransitionPage(
                        child: AppointmentDetailPage(
                  id: int.tryParse(state.params['appointmentId']!)!,
                  extra: state.extra,
                )),
              ),
            ],
          ),
          // * Notification
          GoRoute(
            path: Routes.notification,
            name: Routes.notification,
            pageBuilder: (_, __) =>
                const FadeTransitionPage(child: NotificationPage()),
          ),
          // * Menu
          GoRoute(
            path: Routes.menu,
            name: Routes.menu,
            pageBuilder: (_, __) => const FadeTransitionPage(child: MenuPage()),
            routes: <GoRoute>[
              GoRoute(
                path: Routes.profile,
                name: Routes.profile,
                parentNavigatorKey: moliNavigatorKey,
                pageBuilder: (_, __) =>
                    const CupertinoTransitionPage(child: ProfilePage()),
              )
            ],
          ),
        ],
      ),

      //! Other route
      // * Hospitals
      GoRoute(
        path: Routes.hospitals,
        name: Routes.hospitals,
        pageBuilder: (_, __) =>
            const CupertinoTransitionPage(child: HospitalPage()),
        routes: <GoRoute>[
          GoRoute(
              path: ':hospitalId',
              redirect: (_, GoRouterState state) {
                if (state.extra == null) {
                  return Routes.home;
                }
                return null;
              },
              pageBuilder: (_, GoRouterState state) => CupertinoTransitionPage(
                    child: HospitalDetailPage(
                      hospitalId: int.tryParse(state.params['hospitalId']!)!,
                      extra: state.extra,
                    ),
                  ),
              routes: <RouteBase>[
                GoRoute(
                  path: 'create-appointment-by-hospital',
                  name: 'create-appointment-by-hospital',
                  // parentNavigatorKey: moliNavigatorKey,
                  pageBuilder: (_, GoRouterState state) =>
                      CupertinoTransitionPage(
                    child: CreateAppointmentByHospitalPage(
                      hospitalId: int.tryParse(state.params['hospitalId']!)!,
                      extra: state.extra,
                    ),
                  ),
                ),
                GoRoute(
                    path: 'hospital-doctors',
                    name: 'hospital-doctors',
                    parentNavigatorKey: moliNavigatorKey,
                    pageBuilder: (_, GoRouterState state) =>
                        CupertinoTransitionPage(
                          child: HospitalDoctorsPage(
                            hospitalId:
                                int.tryParse(state.params['hospitalId']!)!,
                          ),
                        ),
                    routes: [
                      GoRoute(
                        path: ':doctorId',
                        pageBuilder: (_, GoRouterState state) =>
                            CupertinoTransitionPage(
                                child: DoctorDetailPage(
                          doctorId: int.tryParse(state.params['doctorId']!)!,
                          extra: state.extra,
                        )),
                      ),
                    ]),
              ]),
        ],
      ),
      // * Doctors
      GoRoute(
        path: Routes.doctors,
        name: Routes.doctors,
        parentNavigatorKey: moliNavigatorKey,
        pageBuilder: (_, __) =>
            const CupertinoTransitionPage(child: DoctorPage()),
        routes: const <GoRoute>[],
      ),
    ],
    errorPageBuilder: (_, __) => const ScaleTransitionPage(child: ErrorPage()),
  );
}
