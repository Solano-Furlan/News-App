part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccessful extends LoginState {}

class LoginWrongEmailError extends LoginState {}

class LoginEmailInUseError extends LoginState {}

class LoginWrongPasswordError extends LoginState {}

class LoginGenralError extends LoginState {}

class LoginLogout extends LoginState {}
