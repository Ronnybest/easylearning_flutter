import 'package:easylearning/pages/sign_up/bloc/sign_up_events.dart';
import 'package:easylearning/pages/sign_up/bloc/sign_up_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocs extends Bloc<SignUpEvent, SignUpStates> {
  SignUpBlocs() : super(const SignUpStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(userName: event.userName));
    //print("${state.userName}");
  }

  void _emailEvent(EmailEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(email: event.email));
    //print("${state.email}");
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(password: event.password));
    //print("${state.password}");
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(rePassword: event.rePassword));
    //print("${state.rePassword}");
  }
}
