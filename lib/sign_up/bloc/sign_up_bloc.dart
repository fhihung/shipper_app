import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shipper_app/sign_up/bloc/sign_up_event.dart';
import 'package:shipper_app/sign_up/bloc/sign_up_state.dart';
import 'package:shipper_app/sign_up/controller/sign_up_controller.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this.signUpController) : super(const SignUpState()) {
    on<SignUpInitiated>(
      _onSignUpInitiated,
    );
    on<SignUpSubmitted>(
      _onSignUpSubmitted,
    );
  }
  final SignUpController signUpController;

  FutureOr<void> _onSignUpInitiated(
    SignUpInitiated event,
    Emitter<SignUpState> emit,
  ) {}

  Future<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      await signUpController.register(
        context: event.context,
        event.address,
        event.phoneNumber,
        name: event.name,
        role: 1,
        email: event.email,
        password: event.password,
        passwordConfirmation: event.passwordConfirmation,
      );
      emit(state.copyWith(isLoading: false));
    } catch (error) {
      // Handle error
      emit(state.copyWith(errorMessage: error.toString(), isLoading: false));
    }
  }
}
