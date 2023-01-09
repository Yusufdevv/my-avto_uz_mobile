part of 'authentication_bloc.dart';

class AuthenticationState {
  final AuthenticationStatus status;
  final UserModel user;
  const AuthenticationState._({required this.status, required this.user});
  const AuthenticationState.authenticated(UserModel user)
      : this._(
          status: AuthenticationStatus.authenticated,
          user: user,
        );
  const AuthenticationState.unauthenticated()
      : this._(
            status: AuthenticationStatus.unauthenticated,
            user: const UserModel());
  const AuthenticationState.loading()
      : this._(status: AuthenticationStatus.loading, user: const UserModel());
}
