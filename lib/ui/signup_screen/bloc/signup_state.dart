import 'package:equatable/equatable.dart';
import 'package:svtvs/ui/signup_screen/response/signup_response.dart';

class SignupState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState extends SignupState {
  final String message;
  SignupSuccessState({required this.message});
  @override
  List<Object?> get props => [message];
}

class SignupFailureState extends SignupState {
  final String message;
  SignupFailureState({required this.message});
  @override
  List<Object?> get props => [message];
}
