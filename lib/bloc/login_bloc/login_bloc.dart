import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/authentication/authentication.repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository authRepository;
  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginWithEmailEvent>(_loginWithEmail);
    on<SignUpWithEmailEvent>(_signUpWithEmail);
  }

  Future<void> _loginWithEmail(
      LoginWithEmailEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final res = await authRepository.signInEmail(
        email: event.email, password: event.password);
    if (res == AppAuthResult.signedInWithEmail) {
      emit(LoginSuccessful());
    }
    if (res == AppAuthResult.errorWrongEmail) {
      emit(LoginWrongEmailError());
    }
    if (res == AppAuthResult.errorWrongPassword) {
      emit(LoginWrongPasswordError());
    } else {
      emit(LoginGenralError());
    }
  }

  Future<void> _signUpWithEmail(
      SignUpWithEmailEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final res = await authRepository.signUpEmail(
        email: event.email, password: event.password);
    if (res == AppAuthResult.signedUpWithEmail) {
      emit(LoginSuccessful());
    }
    if (res == AppAuthResult.emailAlreadyInUse) {
      emit(LoginEmailInUseError());
    } else {
      emit(LoginGenralError());
    }
  }
}
