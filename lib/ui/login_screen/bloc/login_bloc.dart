import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/api/network.dart';
import 'package:svtvs/main.dart';
import 'package:svtvs/ui/login_screen/bloc/login_event.dart';
import 'package:svtvs/ui/login_screen/bloc/login_state.dart';
import 'package:svtvs/ui/login_screen/response/login_response.dart';
import 'package:svtvs/utility/constants.dart';
import 'package:svtvs/utility/shared_prefernce.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginUserEvent>(userLogin);
  }

  Future<void> userLogin(LoginUserEvent event, Emitter<LoginState> emit) async {
    if (await Network.isConnected()) {
      emit(LoginLoadingState());
      LoginResponse response = await repository.loginUser(event.input);
      if (!response.error) {
        SharedPref.setBooleanPreference(Constant.isLoggedIn, true);
        SharedPref.setIntegerPreference(Constant.userId, int.parse(response.userData!.id));
        SharedPref.setStringPreference(Constant.userName, response.userData!.name);
        SharedPref.setStringPreference(Constant.userEmail, response.userData!.email);
        SharedPref.setStringPreference(Constant.userMobile, response.userData!.mobileNo);
        SharedPref.setStringPreference(Constant.authKey, response.userData!.authKey);
        baseOptions.headers.addAll({"Authorization": "Bearer ${response.userData!.authKey}"});
        log("Response= > $response");
        emit(LoginSuccessState(userData: response.userData!));
      } else {
        emit(LoginFailureState(message: response.message));
      }
    } else {
      emit(LoginFailureState(message: Constant.networkAlert));
    }
  }
}
