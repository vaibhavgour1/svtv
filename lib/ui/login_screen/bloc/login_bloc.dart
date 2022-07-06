import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/api/network.dart';
import 'package:svtvs/main.dart';
import 'package:svtvs/ui/login_screen/bloc/login_event.dart';
import 'package:svtvs/ui/login_screen/bloc/login_state.dart';
import 'package:svtvs/ui/login_screen/response/login_response.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginUserEvent>(userLogin);
  }

  Future<void> userLogin(LoginUserEvent event, Emitter<LoginState> emit) async {
    if (await Network.isConnected()) {
      emit(LoginLoadingState());
      LoginResponse response = await repository.loginUser(event.input);
      if (!response.error) {
        emit(LoginSuccessState(userData: response.userData!));
      } else {
        emit(LoginFailureState(message: response.message));
      }
    } else {
      emit(LoginFailureState(message: "No Internet Connection!"));
    }
  }
}
