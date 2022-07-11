import 'package:assignment5/pages/auth_page/bloc/auth_event.dart';
import 'package:assignment5/pages/auth_page/bloc/auth_state.dart';
import 'package:assignment5/services/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/data_account.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Auth auth;
  final DataAccount data;

  AuthBloc(
      {required this.auth, required this.data})
      : super(AuthMenuState()) {

    on<AuthConfirmEvent>((event, emit) async {
      emit(AuthGettingUserState());

      try {
        await auth.auth(data);
        emit(AuthGotUserState());
      } catch (_) {
        emit(AuthErrorState());
      }
    });
  }
}
