import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/api/network.dart';
import 'package:svtvs/main.dart';
import 'package:svtvs/ui/update_profile/bloc/profile_event.dart';
import 'package:svtvs/ui/update_profile/bloc/profile_state.dart';
import 'package:svtvs/ui/update_profile/response/profile_details_response.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileImageEvent>(updateImage);
    on<ProfileDetailsEvent>(updateDetails);
  }

  Future<void> updateImage(
      ProfileImageEvent event, Emitter<ProfileState> emit) async {}

  Future<void> updateDetails(
      ProfileDetailsEvent event, Emitter<ProfileState> emit) async{
    if(await Network.isConnected()){
      ProfileDetailsResponse response = await repository.profileDetailsUpdate();
      if(!response.error){
        emit(ProfileDetailsUploadState(message: response.message));
      } else{
        emit(ProfileFailureState(message: response.message));
      }
    } else{
      emit(ProfileFailureState(message: "No Network Connection!"));
    }
  }
}
