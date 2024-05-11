part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {
  const AuthenticationState();

  List<Object> get props => [];
}

final class AuthenticationInitialState extends AuthenticationState {}

final class AuthenticationLoadingState extends AuthenticationState {
  final bool isLoading;
  const AuthenticationLoadingState({required this.isLoading});
}

class AuthenticationSuccessState extends AuthenticationState {
  final UserModel user;

  const AuthenticationSuccessState(this.user);
  @override
  List<Object> get props => [user];
}
class AuthenticationFailureState extends AuthenticationState {
  final String errorMessage;

  const AuthenticationFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}