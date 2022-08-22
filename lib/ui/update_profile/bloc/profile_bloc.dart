import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/api/network.dart';
import 'package:svtvs/main.dart';
import 'package:svtvs/ui/update_profile/bloc/profile_event.dart';
import 'package:svtvs/ui/update_profile/bloc/profile_state.dart';
import 'package:svtvs/ui/update_profile/response/profile_details_response.dart';
import 'package:svtvs/ui/update_profile/response/profile_details_update_response.dart';
import 'package:svtvs/ui/update_profile/response/profile_image_response.dart';
import 'package:svtvs/utility/constants.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileImageUploadEvent>(updateImage);
    on<ProfileDetailsUploadEvent>(updateDetails);
    on<GetProfileDetailsEvent>(getProfileDetails);
  }

  Future<void> updateImage(ProfileImageUploadEvent event, Emitter<ProfileState> emit) async {
    if (await Network.isConnected()) {
      ProfileImageResponse response = await repository.updateProfileImage(event.imgFile);
      if(!response.error){
        emit(ProfileImageUploadState(imgUrl: response.link));
      } else {
        emit(ProfileImageUploadFailureState(message: response.message));
      }
    } else {
      emit(ProfileImageUploadFailureState(message: Constant.networkAlert));
    }
  }

  Future<void> getProfileDetails(GetProfileDetailsEvent event, Emitter<ProfileState> emit) async {
    if (await Network.isConnected()) {
      emit(ProfileLoadingState());
      UserDetailsResponse response = await repository.getUserDetails();
      if (!response.error) {
        log("Response===> $response");
        emit(GetProfileDetailsState(userInfo: response.info!));
      } else {
        emit(ProfileFailureState(message: response.message));
      }
    } else {
      emit(ProfileFailureState(message: Constant.networkAlert));
    }
  }

  Future<void> updateDetails(ProfileDetailsUploadEvent event, Emitter<ProfileState> emit) async {
    if (await Network.isConnected()) {
      UpdateProfileDetailsResponse response = await repository.updateUserProfile(event.input);
      if (!response.error) {
        emit(ProfileDetailsUploadState(message: response.message));
      }else {
        emit(ProfileDetailsUploadFailureState(message: response.message));
      }
    } else {
      emit(ProfileDetailsUploadFailureState(message: Constant.networkAlert));
    }
  }
}
