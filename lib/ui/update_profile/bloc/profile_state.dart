import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileImageUploadState extends ProfileState {
  final String message;

  ProfileImageUploadState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ProfileDetailsUploadState extends ProfileState {
  final String message;

  ProfileDetailsUploadState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ProfileFailureState extends ProfileState {
  final String message;

  ProfileFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
