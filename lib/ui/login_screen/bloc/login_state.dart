import 'package:equatable/equatable.dart';
import 'package:svtvs/ui/login_screen/response/login_response.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UserData userData;

  LoginSuccessState({required this.userData});

  @override
  List<Object?> get props => [userData];
}

class LoginFailureState extends LoginState {
  final String message;

  LoginFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}