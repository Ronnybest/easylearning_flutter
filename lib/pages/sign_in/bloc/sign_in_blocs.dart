import 'dart:math';

import 'package:easylearning/pages/sign_in/bloc/sign_in_events.dart';
import 'package:easylearning/pages/sign_in/bloc/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvents, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }
}
