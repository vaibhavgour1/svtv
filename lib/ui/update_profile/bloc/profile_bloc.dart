import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/api/network.dart';
import 'package:svtvs/main.dart';
import 'package:svtvs/ui/update_profile/bloc/profile_event.dart';
import 'package:svtvs/ui/update_profile/bloc/profile_state.dart';
import 'package:svtvs/ui/update_profile/response/profile_details_response.dart';
import 'package:svtvs/utility/constants.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileImageEvent>(updateImage);
    on<GetProfileDetailsEvent>(getProfileDetails);
  }

  Future<void> updateImage(
      ProfileImageEvent event, Emitter<ProfileState> emit) async {}

  Future<void> getProfileDetails(
      GetProfileDetailsEvent event, Emitter<ProfileState> emit) async {
    if (await Network.isConnected()) {
      UserDetailsResponse response = await repository.getUserDetails();
      if (!response.error) {
        log("Response===> $response");
        emit(ProfileDetailsUploadState(message: response.message));
      } else {
        emit(ProfileFailureState(message: response.message));
      }
    } else {
      emit(ProfileFailureState(message: Constant.networkAlert));
    }
  }
}
