import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/api/network.dart';
import 'package:svtvs/main.dart';
import 'package:svtvs/ui/catrgory_screen/bloc/category_list_event.dart';
import 'package:svtvs/ui/catrgory_screen/bloc/category_list_state.dart';
import 'package:svtvs/ui/catrgory_screen/response/video_list_response.dart';
import 'package:svtvs/utility/constants.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  CategoryListBloc() : super(CategoryListInitialState()) {
    on<GetCategoryListEvent>(getCategoryList);
  }

  Future<void> getCategoryList(GetCategoryListEvent event, Emitter<CategoryListState> emit) async {
    emit(CategoryListLoadingState());
    if (await Network.isConnected()) {
      VideoListResponse response = await repository.getVideoList(event.input);
      if(!response.error){
        emit(GetCategoryListState(videoList: response.list!));
      } else {
        emit(CategoryListFailureSate(message: response.message));
      }
    } else {
      emit(CategoryListFailureSate(message: Constant.networkAlert));
    }
  }
}
