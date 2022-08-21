import 'package:equatable/equatable.dart';
import 'package:svtvs/ui/video_details_screen/response/video_comments_response.dart';
import 'package:svtvs/ui/video_details_screen/response/video_details_response.dart';

class VideoDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VideoDetailsInitialState extends VideoDetailsState {}

class VideoDetailsLoadingState extends VideoDetailsState {}

class GetVideoDetailsState extends VideoDetailsState {
  final VideoDetails details;

  GetVideoDetailsState({required this.details});

  @override
  List<Object?> get props => [details];
}

class VideoDetailsFailureState extends VideoDetailsState {
  final String message;

  VideoDetailsFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}

class GetVideoLikeState extends VideoDetailsState {
  final String like;

  GetVideoLikeState({required this.like});

  @override
  List<Object?> get props => [like];
}

class GetVideoLikeFailureState extends VideoDetailsState {
  final String message;

  GetVideoLikeFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}

class GetVideoCommentsState extends VideoDetailsState {
  final List<VideoCommentList> commentList;

  GetVideoCommentsState({required this.commentList});

  @override
  List<Object?> get props => [commentList];
}

class GetVideoCommentsFailureState extends VideoDetailsState {
  final String message;

  GetVideoCommentsFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}

class AddCommentsState extends VideoDetailsState {
  final String message;

  AddCommentsState({required this.message});

  @override
  List<Object?> get props => [message];
}

class AddCommentsFailureState extends VideoDetailsState {
  final String message;

  AddCommentsFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
