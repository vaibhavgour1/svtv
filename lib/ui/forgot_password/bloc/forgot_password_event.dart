import 'package:equatable/equatable.dart';

class ForgotPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForgotUserPasswordEvent extends ForgotPasswordEvent {
  final Map input;

  ForgotUserPasswordEvent({required this.input});

  @override
  List<Object?> get props => [input];
}
