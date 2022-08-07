import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/api/network.dart';
import 'package:svtvs/main.dart';
import 'package:svtvs/ui/video_details_screen/bloc/video_details_event.dart';
import 'package:svtvs/ui/video_details_screen/bloc/video_details_state.dart';
import 'package:svtvs/ui/video_details_screen/response/video_comments_response.dart';
import 'package:svtvs/ui/video_details_screen/response/video_details_response.dart';
import 'package:svtvs/ui/video_details_screen/response/video_like_response.dart';
import 'package:svtvs/utility/constants.dart';

class VideoDetailsBloc extends Bloc<VideoDetailsEvent, VideoDetailsState> {
  VideoDetailsBloc() : super(VideoDetailsInitialState()) {
    on<GetVideoDetailsEvent>(getVideoDetails);
    on<LikeVideoEvent>(likeVideo);
    on<GetVideoCommentsEvent>(getComments);
  }

  Future<void> getVideoDetails(GetVideoDetailsEvent event, Emitter<VideoDetailsState> emit) async {
    if (await Network.isConnected()) {
      emit(VideoDetailsLoadingState());
      VideoDetailsResponse response = await repository.getVideoDetails(event.input);
      if (!response.error) {
        emit(GetVideoDetailsState(details: response.videoDetails!));
      } else {
        emit(VideoDetailsFailureState(message: response.message));
      }
    } else {
      emit(VideoDetailsFailureState(message: Constant.networkAlert));
    }
  }

  Future<void> likeVideo(LikeVideoEvent event, Emitter<VideoDetailsState> emit) async {
    if (await Network.isConnected()) {
      VideoLikesResponse response = await repository.likeVideo(event.input);
      if (!response.error) {
        emit(GetVideoLikeState(like: response.info));
      } else {
        emit(GetVideoLikeFailureState(message: response.message));
      }
    } else {
      emit(VideoDetailsFailureState(message: Constant.networkAlert));
    }
  }

  Future<void> getComments(GetVideoCommentsEvent event, Emitter<VideoDetailsState> emit) async {
    if (await Network.isConnected()) {
      VideoCommentsResponse response = await repository.getComments(event.input);
      if (!response.error) {
        emit(GetVideoCommentsState(commentList: response.list!));
      } else {
        emit(GetVideoCommentsFailureState(message: response.message));
      }
    } else {
      emit(GetVideoCommentsFailureState(message: Constant.networkAlert));
    }
  }
}
