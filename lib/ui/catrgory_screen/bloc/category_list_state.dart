import 'package:equatable/equatable.dart';
import 'package:svtvs/ui/catrgory_screen/response/video_list_response.dart';

class CategoryListState extends Equatable {
  @override
  List<Object?> get props => throw [];
}

class CategoryListInitialState extends CategoryListState {}

class CategoryListLoadingState extends CategoryListState {}

class GetCategoryListState extends CategoryListState {
  final List<VideoDetails> videoList;

  GetCategoryListState({required this.videoList});

  @override
  List<Object?> get props => throw [videoList];
}

class CategoryListFailureSate extends CategoryListState {
  final String message;

  CategoryListFailureSate({required this.message});

  @override
  List<Object?> get props => throw [message];
}
