import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/ui/reset_password/bloc/reset_password_event.dart';
import 'package:svtvs/ui/reset_password/bloc/reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitialState()) {
    on<ResetUserPassword>(resetPassword);
  }

  FutureOr<void> resetPassword(
      ResetUserPassword event, Emitter<ResetPasswordState> emit) async {
    emit(ResetPasswordLoadingState());
  }
}
