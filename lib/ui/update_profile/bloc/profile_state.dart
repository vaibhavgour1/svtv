import 'package:equatable/equatable.dart';
import 'package:svtvs/ui/update_profile/response/profile_details_response.dart';

class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class GetProfileDetailsState extends ProfileState {
  final UserInfo userInfo;

  GetProfileDetailsState({required this.userInfo});

  @override
  List<Object?> get props => [userInfo];
}

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

class ProfileDetailsUploadFailureState extends ProfileState {
  final String message;

  ProfileDetailsUploadFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}


class ProfileFailureState extends ProfileState {
  final String message;

  ProfileFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
