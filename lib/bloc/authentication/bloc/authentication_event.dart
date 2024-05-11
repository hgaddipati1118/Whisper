part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];
 
}

class SignUpUser extends AuthenticationEvent {
  final String email;
  final String password;

  const SignUpUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class LoginUser extends AuthenticationEvent {
  final String email;
  final String password;

  const LoginUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class GetUser extends AuthenticationEvent {
}


class SignOut extends AuthenticationEvent {}