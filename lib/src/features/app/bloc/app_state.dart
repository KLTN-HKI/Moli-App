part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.authenticated() = _Authenticated;
  const factory AppState.unauthenticated() = _Unauthenticated;
  const factory AppState.maintenance() = _Maintenance;
}
