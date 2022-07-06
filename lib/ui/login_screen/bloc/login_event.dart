import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final Map input;

  LoginUserEvent({required this.input});

  @override
  List<Object?> get props => [input];
}
