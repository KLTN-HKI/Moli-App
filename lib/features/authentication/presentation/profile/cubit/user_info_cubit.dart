import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moli_app/features/features.dart';

part 'user_info_state.dart';
part 'user_info_cubit.freezed.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authRepo = authenticationRepository,
        super(const UserInfoState.initial());

  final AuthenticationRepository _authRepo;
}
