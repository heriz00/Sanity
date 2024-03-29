part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {}

class LoginAuthenticated extends LoginState {}

class LoginUnAuthenticated extends LoginState {}

class LoginEmailNotVerified extends LoginState {}

class LoginTokenError extends LoginState {}

class SignInAuthenticated extends LoginState {}

class InformationNotSeen extends LoginState {}

class LoginError extends LoginState {
  final String msg;

  const LoginError({required this.msg});
  @override
  List<Object> get props => [msg];
}
