import 'package:equatable/equatable.dart';

class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProfileDetailsEvent extends ProfileEvent {}

class ProfileImageUploadEvent extends ProfileEvent {
  final Map input;

  ProfileImageUploadEvent({required this.input});

  @override
  List<Object?> get props => [input];
}

class ProfileDetailsUploadEvent extends ProfileEvent {
  final Map input;

  ProfileDetailsUploadEvent({required this.input});

  @override
  List<Object?> get props => [input];
}
