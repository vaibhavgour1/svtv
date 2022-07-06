import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/api/network.dart';
import 'package:svtvs/main.dart';
import 'package:svtvs/ui/signup_screen/bloc/signup_event.dart';
import 'package:svtvs/ui/signup_screen/bloc/signup_state.dart';
import 'package:svtvs/ui/signup_screen/response/signup_response.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitialState()) {
    on<UserSignupEvent>(signUp);
  }

  Future<void> signUp(UserSignupEvent event, Emitter<SignupState> emit) async {
    if (await Network.isConnected()) {
     // emit(SignupLoadingState());
      log("${event.input}");
      SignupResponse response = await repository.signupUser(event.input);
      if (!response.error) {
        emit(SignupSuccessState(userDetails: response.info!));
      } else {
        emit(SignupFailureState(message: response.message));
      }
    } else {
      emit(SignupFailureState(message: "No Internet Connection!"));
    }
  }
}
