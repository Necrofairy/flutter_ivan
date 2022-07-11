
abstract class AuthState {}

class AuthMenuState extends AuthState{}

class AuthGettingUserState extends AuthState {}

class AuthGotUserState extends AuthState {
}

class AuthErrorState extends AuthState {}


