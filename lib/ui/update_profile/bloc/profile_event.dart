import 'package:equatable/equatable.dart';

class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileImageEvent extends ProfileEvent {
  final Map input;

  ProfileImageEvent({required this.input});

  @override
  List<Object?> get props => [input];
}

class GetProfileDetailsEvent extends ProfileEvent {}
