import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/ui/forgot_password/bloc/forgot_password_event.dart';
import 'package:svtvs/ui/forgot_password/bloc/forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitialState()) {
    on<ForgotUserPasswordEvent>(forgotPassword);
  }

  Future<void> forgotPassword(
      ForgotUserPasswordEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordLoadingState());
  }
}
