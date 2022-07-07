import 'package:equatable/equatable.dart';

class ForgotPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}


class ForgotPasswordInitialState extends ForgotPasswordState{}

class ForgotPasswordLoadingState extends ForgotPasswordState{}

class ForgotPasswordSuccessState extends ForgotPasswordState {
  final String message;

  ForgotPasswordSuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ForgotPasswordFailureState extends ForgotPasswordState {
  final String message;

  ForgotPasswordFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}