import 'package:equatable/equatable.dart';

class ResetPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResetPasswordInitialState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordSuccessState extends ResetPasswordState {
  final String message;

  ResetPasswordSuccessState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ResetPasswordFailureState extends ResetPasswordState {
  final String message;

  ResetPasswordFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
