import 'package:equatable/equatable.dart';

class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserSignupEvent extends SignupEvent {
  final Map input;
  UserSignupEvent({required this.input});
  @override
  List<Object?> get props => [input];
}
