part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class LoginWithEmailEvent extends LoginEvent {
  final String email;
  final String password;

  LoginWithEmailEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignUpWithEmailEvent extends LoginEvent {
  final String email;
  final String password;

  SignUpWithEmailEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
