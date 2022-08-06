import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/api/network.dart';
import 'package:svtvs/main.dart';
import 'package:svtvs/ui/forgot_password/bloc/forgot_password_event.dart';
import 'package:svtvs/ui/forgot_password/bloc/forgot_password_state.dart';
import 'package:svtvs/ui/forgot_password/response/forgot_password_response.dart';
import 'package:svtvs/utility/constants.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitialState()) {
    on<ForgotUserPasswordEvent>(forgotPassword);
  }

  Future<void> forgotPassword(
      ForgotUserPasswordEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordLoadingState());
    if(await Network.isConnected()){
      ForgotPasswordResponse response  = await repository.forgotPassword(event.input);
      if(!response.error){
        emit(ForgotPasswordSuccessState(message: response.message));
      }else{
        emit(ForgotPasswordFailureState(message: response.message));
      }
    } else{
      emit(ForgotPasswordFailureState(message: Constant.networkAlert));
    }
  }
}
