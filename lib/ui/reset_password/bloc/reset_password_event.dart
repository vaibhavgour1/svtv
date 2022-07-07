import 'package:equatable/equatable.dart';

class ResetPasswordEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class ResetUserPassword extends ResetPasswordEvent{
  final Map input;
  ResetUserPassword({required this.input});
  @override
  List<Object?> get props => [input];
}